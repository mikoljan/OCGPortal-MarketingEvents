﻿require(["jquery", "knockout", "moment", "bootstrap", "spscripts!", "helpers", "validator", "camljs", "jqueryui", "kobindings", "datetimepicker", "entities/participant"], function ($, ko, moment) {

    viewFormViewModel = function () {
        var self = this;

        // ---------------------------------Variables---------------------------------

        // Text fields
        self.title = ko.observable();
        self.city = ko.observable();
        self.country = ko.observable();
        self.organizator = ko.observable();
        self.contact = ko.observable();

        self.marketingGroupsLSShare = ko.observable();
        self.marketingGroupsMFShare = ko.observable();
        self.marketingGroupsMTShare = ko.observable();
        self.marketingGroupsTotal = ko.computed(function () {
            var total = (isNaN(parseInt(self.marketingGroupsLSShare(), 10)) ? 0 : parseInt(self.marketingGroupsLSShare(), 10)) +
                        (isNaN(parseInt(self.marketingGroupsMFShare(), 10)) ? 0 : parseInt(self.marketingGroupsMFShare(), 10)) +
                        (isNaN(parseInt(self.marketingGroupsMTShare(), 10)) ? 0 : parseInt(self.marketingGroupsMTShare(), 10));

            return total;
        }, this);

        self.prodGroupLSShare = ko.observable();
        self.prodGroupIEShare = ko.observable();
        self.prodGroupNDTShare = ko.observable();
        self.prodGroupRVIShare = ko.observable();
        self.prodGroupANIShare = ko.observable();
        self.prodGroupTotal = ko.computed(function () {
            
            var set = (self.prodGroupLSShare() + self.prodGroupIEShare() + self.prodGroupNDTShare() + self.prodGroupRVIShare() + self.prodGroupANIShare())
            
            var total = (isNaN(parseInt(self.prodGroupLSShare(), 10)) ? 0 : parseInt(self.prodGroupLSShare(), 10)) +
                (isNaN(parseInt(self.prodGroupIEShare(), 10)) ? 0 : parseInt(self.prodGroupIEShare(), 10)) +
                (isNaN(parseInt(self.prodGroupNDTShare(), 10)) ? 0 : parseInt(self.prodGroupNDTShare(), 10)) +
                (isNaN(parseInt(self.prodGroupRVIShare(), 10)) ? 0 : parseInt(self.prodGroupRVIShare(), 10)) +
                (isNaN(parseInt(self.prodGroupANIShare(), 10)) ? 0 : parseInt(self.prodGroupANIShare(), 10));

            return total;
        }, this);

        self.docFolder = ko.observable();

        self.contributionName = ko.observable();

        self.advertismentTopic = ko.observable();
        self.advertismentFormat = ko.observable();

        self.boothComment = ko.observable();
        self.boothDemo = ko.observable();

        self.bags = ko.observable(0);
        self.pens = ko.observable(0);
        self.notepads = ko.observable(0);
        self.additional = ko.observable();
        self.disAddress = ko.observable();
        self.note = ko.observable();

        self.contractPrice = ko.observable();


        // Date fields
        self.startDate = ko.observable();
        self.endDate = ko.observable();
        self.registration = ko.observable();

        self.advertismentDeliveryDate = ko.observable();

        self.promotionDate = ko.observable();

        self.draftContractDate = ko.observable();
        self.contractAcceptedDate = ko.observable();
        self.invoiceDate = ko.observable();

        // Date/Time fields
        self.contributionTime = ko.observable(new Date);
        /*self.contributionTimeCompute = ko.computed(function () {
            console.log("self.contributionTime(): " + self.contributionTime());
            console.log("ISO: " + self.contributionTime().toISOString());
        }, this);*/


        // Choice fields
        self.company = ko.observable();
        self.availableCompany = ko.observableArray();

        self.eventProvider = ko.observable();
        self.availableEventProvider = ko.observableArray();

        self.status = ko.observable();
        self.availableStatus = ko.observableArray();

        self.fiscalYear = ko.observable();
        self.availableFiscalYear = ko.observableArray(["Please select a value..."]);

        self.specification = ko.observable();
        self.availableSpecification = ko.observableArray();

        self.currency = ko.observable();
        self.availableCurrency = ko.observableArray();

        // LookUp fields

        // CheckBox fields
        self.participantsCheck = ko.observable();
        self.contributionCheck = ko.observable();
        self.advertismentCheck = ko.observable();
        self.boothCheck = ko.observable();
        self.promotionCheck = ko.observable();
        self.contractCheck = ko.observable();

        self.marketingGroupsIB = ko.observable();
        self.marketingGroupsLS = ko.observable();
        self.delivered = ko.observable();
        self.webLogo = ko.observable();
        self.bookLogo = ko.observable();
        self.banner = ko.observable();
        self.dispatched = ko.observable();
        self.VATIncluded = ko.observable();
        self.boothPhoto = ko.observable();
        self.logoCollection = ko.observable();
        self.logoOnWeb = ko.observable();
        self.conferenceAgenda = ko.observable();
        self.approval = ko.observable();

        // PeoplePicker fields
        self.internalIntermediary = ko.observableArray();
        self.internalIntermediaryID = ko.observable();
        self.internalIntermediaryIDCompute = ko.computed(function () {

            if (self.internalIntermediary()[0]) {
                var userFnc = self.getUserIdFromLogin(self.internalIntermediary()[0]);
                userFnc.then(function (driverID) {
                    console.log("Net Acc ID: " + driverID);

                    self.internalIntermediaryID(driverID);
                });
            }
        }, this);

        // Calculated fields 
        self.participants = ko.observableArray();

        // other helpers
        self.isEditMode = ko.observable(false);
        self.isInitialized = ko.observable(false);
        self.itemID = ko.observable();
        self.canEdit = ko.observable(false);
        var landingPage = '/SitePages/Dashboard.aspx';

        // ---------------------------------Functions---------------------------------

        // Init function 
        self.init = function () {
            self.getCurrentUserPermission();
            // init bs validation
            //$('#AddressBookForm').validator(self.orderValidationOptions);

            var itemID = getUrlParameter("ID");
            if (itemID) {
                self.itemID(itemID);
                self.loadForm(itemID);
                self.isEditMode(true);
            }
            else {
                self.isInitialized(true);
            }
        }


        // Closes form and returns to list
        self.closeForm = function () {
            var sourceUrl = getUrlParameter("Source");
            var webUrl = _spPageContextInfo.siteAbsoluteUrl;

            if (sourceUrl.length > 0) {
                window.location.replace(sourceUrl);
            }
            else {
                window.location.replace(webUrl + landingPage);
            }
        }

        // Load item from list
        self.loadForm = function (itemID) {
            try {
                self.loadParticipants(itemID);

                var context = SP.ClientContext.get_current();
                var list = context.get_web().get_lists().getByTitle("MarketingEvents");
                var item = list.getItemById(itemID);
                context.load(item);

                context.executeQueryAsync(
                    function () {
                        self.title(item.get_item('Title'));
                        self.city(item.get_item('Location'));
                        self.country(item.get_item('LocationCountry'));
                        self.organizator(item.get_item('Organizer'));
                        self.contact(item.get_item('Contact'));
                        self.marketingGroupsLSShare(item.get_item('MarketGroupLSShare'));
                        self.marketingGroupsMFShare(item.get_item('MarketGroupMFShare'));
                        self.marketingGroupsMTShare(item.get_item('MarketGroupMTShare'));
                        self.prodGroupLSShare(item.get_item('ProdGroupLSShare'));
                        self.prodGroupIEShare(item.get_item('ProdGroupIEShare'));
                        self.prodGroupNDTShare(item.get_item('ProdGroupNDTShare'));
                        self.prodGroupRVIShare(item.get_item('ProdGroupRVIShare'));
                        self.prodGroupANIShare(item.get_item('ProdGroupANIShare'));
                        self.docFolder(item.get_item('DocumentFolder'));
                        self.contributionName(item.get_item('ContributionName'));
                        self.advertismentTopic(item.get_item('AdvertisingTopic'));
                        self.advertismentFormat(item.get_item('AdvertisementFormat'));
                        self.boothComment(item.get_item('Other'));
                        self.boothDemo(item.get_item('DemoRequired'));
                        self.bags(item.get_item('PromotionBags'));
                        self.pens(item.get_item('PromotionPens'));
                        self.notepads(item.get_item('PromotionNotebooks'));
                        self.additional(item.get_item('AdditionalPromotion'));
                        self.disAddress(item.get_item('PromotionMaterialDispatchAddress'));
                        self.note(item.get_item('Note'));
                        self.contractPrice(item.get_item('AgreementPrice'));
                        self.startDate(item.get_item('EventStart'));
                        self.endDate(item.get_item('EventEnd'));
                        self.registration(item.get_item('RegistrationUntil'));
                        self.advertismentDeliveryDate(item.get_item('AdvertisingDeliveryDate'));
                        //console.log(item.get_item('AdvertisingDeliveryDate'));
                        self.promotionDate(item.get_item('PromotionMaterialDispatchDueDate'));
                        self.draftContractDate(item.get_item('DraftContractDate'));
                        self.contractAcceptedDate(item.get_item('ContractAcceptedDate'));
                        self.invoiceDate(item.get_item('InvoiceDate'));
                        self.contributionTime(item.get_item('ContributionTime'));
                        self.company(item.get_item('EventCompany'));
                        self.eventProvider(item.get_item('EventProvider'));
                        self.status(item.get_item('EventStatus'));
                        self.fiscalYear(item.get_item('FiscalYear0'));
                        self.specification(item.get_item('BoothSpecification'));
                        self.currency(item.get_item('Currency'));
                        //self.internalIntermediaryID(item.get_item('Intermediary'));
                        if (item.get_item("Intermediary")) {
                            var intermediaryId = item.get_item("Intermediary")[0].get_lookupId();
                            self.internalIntermediaryID(intermediaryId);
                            getUser(intermediaryId).then(function (spuser) {
                                self.internalIntermediary([spuser.get_loginName()]);
                            });
                        }

                        self.participantsCheck(item.get_item('ParticipantsCheck'));
                        if (self.participantsCheck()) $('#participantsCollapse').collapse();

                        self.contributionCheck(item.get_item('ContributionsCheck'));
                        if (self.contributionCheck()) $('#contributionCollapse').collapse();

                        self.advertismentCheck(item.get_item('AdvertisementCheck'));
                        if (self.advertismentCheck()) $('#advertismentCollapse').collapse();

                        self.boothCheck(item.get_item('Kiosk'));
                        if (self.boothCheck()) $('#boothCollapse').collapse();

                        self.promotionCheck(item.get_item('PromotionCheck'));
                        if (self.promotionCheck()) $('#promotionCollapse').collapse();

                        self.contractCheck(item.get_item('ContractCheck'));
                        if (self.contractCheck()) $('#contractCollapse').collapse();

                        self.delivered(item.get_item('AdvertisingDelivered'));
                        self.webLogo(item.get_item('PlacedLogoOnWeb'));
                        self.bookLogo(item.get_item('PlacedLogoInCollection'));
                        self.banner(item.get_item('PlacedBanner'));
                        self.dispatched(item.get_item('PromotionMaterialDispatchComplet'));
                        self.VATIncluded(item.get_item('VATIncluded'));
                        self.boothPhoto(item.get_item('KioskPhoto'));
                        self.logoCollection(item.get_item('LogoCollection'));
                        self.logoOnWeb(item.get_item('LogoOnWeb'));
                        self.conferenceAgenda(item.get_item('ConferenceAgenda'));
                        self.approval(item.get_item('SendForApproval'));

                        if (item.get_item("MarketingGroup")) {
                            var tmpArray = item.get_item("MarketingGroup")[0].split(",");
                            if (tmpArray.includes("IB"))
                                self.marketingGroupsIB(true);

                            if (tmpArray.includes("LS"))
                                self.marketingGroupsLS(true);
                        }

                        self.isInitialized(true);

                        $(document).ready(function () {
                            setTimeout(function () {
                                $(".sp-peoplepicker-delImage").remove();
                            }, 1000);
                        });
                    },
                    function (s, a) {
                        console.log(a.get_message() + '\n' + a.get_stackTrace());

                        self.isInitialized(true);
                    }
                );
            }
            catch (err) {
                console.log(err.message);
            }

        }

        // Loads participants
        self.loadParticipants = function (itemID) {
            var clientContext = SP.ClientContext.get_current();
            var participantsList = clientContext.get_web().get_lists().getByTitle('MarketingEventsParticipants');
            var collListItems;

            var camlQuery = new SP.CamlQuery();
            camlQuery.set_viewXml(
                "<View><Query>" +
                "<Where>" +
                "<Eq><FieldRef Name='MarketingEvent' LookupId='TRUE' /><Value Type='Lookup'>" + itemID + "</Value></Eq>" +
                "</Where>" +
                "</Query></View>");
            collListItems = participantsList.getItems(camlQuery);

            clientContext.load(collListItems);
            clientContext.executeQueryAsync(
                Function.createDelegate(this, successHandler),
                Function.createDelegate(this, errorHandler)
            );

            function successHandler() {
                var listItemEnumerator = collListItems.getEnumerator();
                var counter = 0;

                while (listItemEnumerator.moveNext()) {
                    var listitem = listItemEnumerator.get_current();

                    /*var listiteminfo = '\nID:' + listitem.get_id() +
                        '\nUser:' + listitem.get_item("User").get_lookupValue() +
                        '\nAccommodation:' + listitem.get_item('Accommodation') +
                        '\nAccommodationFrom:' + listitem.get_item('AccommodationFrom') +
                        '\nAccommodationTo:' + listitem.get_item('AccommodationTo') +
                        '\nBooked:' + listitem.get_item('Booked');

                    console.log(listiteminfo);*/

                    tmpParticipant = new participant();

                    tmpParticipant.rowID(counter);
                    counter++;
                    tmpParticipant.isNew(false);

                    if (listitem.get_item("User")) {
                        tmpParticipant.user([listitem.get_item("User").get_lookupValue()]);
                    }
                    tmpParticipant.accommodation(listitem.get_item('Accommodation'));
                    tmpParticipant.accommodationFrom(listitem.get_item('AccommodationFrom'));
                    tmpParticipant.accommodationTo(listitem.get_item('AccommodationTo'));
                    tmpParticipant.booked(listitem.get_item('Booked'));
                    tmpParticipant.participantID(listitem.get_id());

                    self.participants.push(tmpParticipant);

                }

                $(".generated_peoplepicker :input").attr("disabled", true);

                //alert(self.participants()[0].accommodationFrom());
            }

            function errorHandler() {
                alert("Request failed: " + arguments[1].get_message()) ;
            }
        }

        // Gets users userID
        self.getUserIdFromLogin = function (loginName) {
            var context = SP.ClientContext.get_current();
            var spuser = context.get_web().ensureUser(loginName);
            console.log("Finding by login name: " + loginName);
            context.load(spuser);

            return executeQueryAsyncDeferred(context, null).then(function () {
                return spuser.get_id();
            });
        }

        // Goto EditForm
        self.edit = function () {
            window.location.replace(_spPageContextInfo.webAbsoluteUrl + '/' + _spPageContextInfo.layoutsUrl + "/OCGportal.MarketingEvents/MarketingEventsEditForm.aspx" + '?ID=' + getUrlParameter("ID") + "&Source=" + getUrlParameter("Source"));
        }

        // Check if user can edit
        self.getCurrentUserPermission = function () {
            var web, clientContext, currentUser, oList, perMask;

            clientContext = new SP.ClientContext.get_current();
            web = clientContext.get_web();
            currentUser = web.get_currentUser();
            oList = web.get_lists().getByTitle('MarketingEvents');
            clientContext.load(oList, 'EffectiveBasePermissions');
            clientContext.load(currentUser);
            clientContext.load(web);

            clientContext.executeQueryAsync(function () {
                if (oList.get_effectiveBasePermissions().has(SP.PermissionKind.editListItems)) {
                    console.log("user has edit permission");
                    self.canEdit(true);
                } else {
                    console.log("user doesn't have edit permission");
                    self.canEdit(false);
                }
            }, function (sender, args) {
                console.log('request failed ' + args.get_message() + '\n' + args.get_stackTrace());
            });
        }
    }



    // --------------------------INIT--------------------------

    var tvm = new viewFormViewModel();
    ko.applyBindings(tvm);
    tvm.init()

    $("#internalIntermediary_TopSpan").addClass("form-control");
    $("#internalIntermediary :input").attr("disabled", true); 
    
    
});
