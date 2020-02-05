<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketingEventsEditForm.aspx.cs" Inherits="OCGportal.MarketingEvents.Layouts.OCGportal.MarketingEvents.MarketingEventsEditForm" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="/_layouts/15/OCGportal.MarketingEvents/js/libs/require.js" data-main="/_layouts/15/OCGportal.MarketingEvents/js/editFormViewModel"></script>
    <script type="text/javascript" src="/_layouts/15/OCGportal.MarketingEvents/js/require.config.js"></script>
    
    <link href="/_layouts/15/OCGportal.MarketingEvents/css/jqueryui/jquery-ui.min.css" rel="stylesheet" />
    <link href="/_layouts/15/OCGportal.MarketingEvents/css/libs/bootstrap-datetimepicker.min.css" rel="stylesheet" />
    <link href="/_layouts/15/OCGportal.MarketingEvents/css/libs/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="/_layouts/15/OCGportal.MarketingEvents/css/jqueryui/jquery-ui-timepicker-addon.css" rel="stylesheet" />
    <link href="/_layouts/15/OCGportal.MarketingEvents/css/libs/fileinput.min.css" rel="stylesheet" type="text/css"/>
    <link href="/_layouts/15/OCGportal.MarketingEvents/css/libs/font-awesome.min.css" rel="stylesheet" type="text/css"/> 
    <link href="/_layouts/15/OCGportal.MarketingEvents/css/MarketingEvents.css" rel="stylesheet" />
    <link href="/_layouts/15/OCGportal.MarketingEvents/css/validator.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Main" ContentPlaceHolderID="PlaceHolderMain" runat="server">


    <div id="AddressBookForm" class="container-fluid" style="display:none" data-bind="visible: isInitialized">
        <div class="row">
            <div class="form-group col-2">
                <label for="company">Company</label>
                <select id="company" class="form-control" data-bind="options: availableCompany, value: company"></select>
            </div>
            <div class="form-group col-5">
                <label for="eventProvider">Event Provider</label>
                <select id="eventProvider" class="form-control" data-bind="options: availableEventProvider, value: eventProvider"></select>
            </div>
            <div class="form-group col-5">
                <label for="status">Status</label>
                <select id="status" class="form-control" data-bind="options: availableStatus, value: status"></select>
            </div>
        </div>

        <div class="row">
            <div class="col-6" style="padding-left:0px;">
                <div class="form-group col-12">
                    <label for="title">Event Title</label>
                    <input type="text" class="form-control" id="title" data-bind="value: title"/>
                </div>
                <div class="form-group col-6">
                    <label for="startDate">Start Date</label>
                    <input type="text" class="form-control" id="startDate" placeholder="Start Date" data-bind="datepicker: startDate"/>
                </div>
                <div class="row" style="padding-left:15px; padding-right:15px">
                    <div class="form-group col-6">
                        <label for="endDate">End Date</label>
                        <input type="text" class="form-control" id="endDate" placeholder="End Date" data-bind="datepicker: endDate"/>
                    </div>
                    <div class="form-group col-6">
                        <label for="fiscalYear">Fiscal Year</label>
                        <select id="fiscalYear" class="form-control" data-bind="options: availableFiscalYear, value: fiscalYear"></select>
                    </div>
                </div>
                <div class="row" style="padding-left:15px; padding-right:15px">
                    <div class="form-group col-6">
                        <label for="city">City</label>
                        <input type="text" class="form-control" id="city" data-bind="value: city"/>
                    </div>
                    <div class="form-group col-6">
                        <label for="country">Country</label>
                        <input type="text" class="form-control" id="country" data-bind="value: country"/>
                    </div>
                </div>
                <div class="form-group col-12">
                    <label for="organizator">Event Organizator</label>
                    <input type="text" class="form-control" id="organizator" data-bind="value: organizator"/>
                </div>
                <div class="form-group col-12">
                    <label for="contact">On-Site Contact</label>
                    <input type="text" class="form-control" id="contact" data-bind="value: contact"/>
                </div>
                <div class="form-group col-12">
                    <label for="internalIntermediary">Internal Intermediary</label>
                    <div id="internalIntermediary" style="width: auto; height: auto" data-bind="clientPeoplePicker: { data: internalIntermediary, options: { AllowMultipleValues: false } }"></div>
                </div>
            </div>
            <div class="col-3" style="padding-left:0px;">
                <h6 class="text-left">Marketing Groups</h6>
                <hr />
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="MarketingGroupsIB" data-bind="checked: marketingGroupsIB">
                    <label class="form-check-label" for="MarketingGroupsIB">
                        IB
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="MarketingGroupsLS" data-bind="checked: marketingGroupsLS">
                    <label class="form-check-label" for="MarketingGroupsLS">
                        LS
                    </label>
                </div>
                <br />
                <br />
                <div class="form-group col-12">
                    <label for="marketingGroupsLSShare">LS</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="marketingGroupsLSShare" data-bind="value: marketingGroupsLSShare"/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>                
                <div class="form-group col-12">
                    <label for="marketingGroupsMFShare">MF</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="marketingGroupsMFShare" data-bind="value: marketingGroupsMFShare"/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>
                <div class="form-group col-12">
                    <label for="marketingGroupsMTShare">MT</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="marketingGroupsMTShare" data-bind="value: marketingGroupsMTShare"/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>
                <div class="form-group col-12">
                    <label for="marketingGroupsTotal">Total</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="marketingGroupsTotal" data-bind="value: marketingGroupsTotal" disabled/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>
                <div class="form-group col-12">
                    <label for="registration">Registration</label>
                    <input type="text" class="form-control" id="registration" placeholder="Registration" data-bind="datepicker: registration"/>
                </div>
            </div>
            <div class="col-3" style="padding-left:0px;">
                <h6 class="text-left">Product Groups</h6>
                <hr />
                <div class="form-group col-12">
                    <label for="ProdGroupLSShare">LS</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="ProdGroupLSShare" data-bind="value: prodGroupLSShare"/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div><div class="form-group col-12">
                    <label for="ProdGroupIEShare">IE</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="ProdGroupIEShare" data-bind="value: prodGroupIEShare"/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>                
                <div class="form-group col-12">
                    <label for="ProdGroupNDTShare">NDT</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="ProdGroupNDTShare" data-bind="value: prodGroupNDTShare"/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>                
                <div class="form-group col-12">
                    <label for="ProdGroupRVIShare">RVI</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="ProdGroupRVIShare" data-bind="value: prodGroupRVIShare"/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>                
                <div class="form-group col-12">
                    <label for="ProdGroupANIShare">ANI</label>
                    <div class="input-group">
                        <input type="text" class="form-control" id="ProdGroupANIShare" data-bind="value: prodGroupANIShare"/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>
                <div class="form-group col-12">
                    <label for="prodGroupTotal">Total</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="prodGroupTotal" data-bind="value: prodGroupTotal" disabled/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>
                
            </div>
        </div>

        <div class="row">
            <div class="form-group col-12">
                <label for="DocFolder">Shared folder</label>
                <input type="text" class="form-control" id="DocFolder" data-bind="value: docFolder"/>
            </div>
        </div>

        <!-- ------------------------------------------PARTICIPANTS------------------------------------------ -->
        

        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#participantsCollapse">
                    <h6 class="p-4 custom-header">PARTICIPANTS</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: participantsCheck"/>
                </label>
            </div>
            <div id="participantsCollapse" class="collapse" >
                <div class="card-body">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th style="vertical-align: middle">User</th>
                                <th style="vertical-align: middle">Accommodation</th>
                                <th style="vertical-align: middle">From</th>
                                <th style="vertical-align: middle">To</th>
                                <th style="vertical-align: middle">Booked</th>
                            </tr>
                        </thead>
                        <tbody data-bind="foreach: participants">
                            <tr>
                                <td style="width: 225px; height: 45px;">
                                    <div style="width: auto; height: auto" data-bind="clientPeoplePicker: { data: user, options: { AllowMultipleValues: false } }"></div>
                                </td>
                                <td style="text-align: center;">
                                    <input type="checkbox" data-bind="checked: accommodation" style="width: 15px; height: 15px;"/>
                                </td>
                                <td>
                                    <input type="text" data-bind="datepicker: accommodationFrom, visible: accommodation" style="width: 100%" />
                                </td>
                                <td>
                                    <input type="text" data-bind="datepicker: accommodationTo, visible: accommodation" style="width: 100%" />
                                </td>
                                <td style="text-align: center;">
                                    <input type="checkbox" data-bind="checked: booked, visible: accommodation" style="width: 15px; height: 15px;"/>
                                </td>
                                <td style="text-align: center;">
                                    <button type="button" class="btn btn-sm"><i class="fa fa-trash"></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- ------------------------------------------CONTRIBUTION------------------------------------------ -->
        
        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#contributionCollapse">
                    <h6 class="p-4 custom-header">CONTRIBUTION</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: contributionCheck"/>
                </label>
            </div>
            <div id="contributionCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="contributionName">Title</label>
                            <input type="text" class="form-control" id="contributionName" data-bind="value: contributionName"/>
                        </div>
                        <div class="form-group col-4">
                            <label for="contributionTime">Date/Time</label>
                            <input type="text" class="form-control" id="contributionTime" data-bind="datetimepicker: contributionTime"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ------------------------------------------ADVERTISEMENT------------------------------------------ -->
            
        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#advertismentCollapse">
                    <h6 class="p-4 custom-header">ADVERTISEMENT</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: advertismentCheck"/>
                </label>
            </div>
            <div id="advertismentCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="advertismentTopic">Topic</label>
                            <input type="text" class="form-control" id="advertismentTopic" data-bind="value: advertismentTopic"/>
                        </div>
                        <div class="form-group col-3">  
                            <label for="advertismentDeliveryDate">Until</label>
                                <input type="text" class="form-control" id="advertismentDeliveryDate" data-bind="datepicker: advertismentDeliveryDate"/>
                        </div>
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Delivered: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: delivered"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Logo on web: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: webLogo"></label>
                            </div>
                        </div>
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Logo in abstract book: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: bookLogo"></label>
                            </div>
                        </div>
                        <div class="form-group col-3">  
                            <label for="advertismentFormat">Format</label>
                            <input type="text" class="form-control" id="advertismentFormat" data-bind="value: advertismentFormat"/>
                        </div>
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Banner: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: banner"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            
        <!-- ------------------------------------------BOOTH------------------------------------------ -->

        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label  data-toggle="collapse" data-target="#boothCollapse">
                    <h6 class="p-4 custom-header">BOOTH</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: boothCheck"/>
                </label>
            </div>
            <div id="boothCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-4">
                            <label for="specification">Specification</label>
                            <select id="specification" class="form-control" data-bind="options: availableSpecification, value: specification"></select>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="comment">Comment</label>
                            <textarea class="form-control custom-view-label" style="resize: none" id="comment" rows="3" data-bind="value: boothComment"></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="demoReq">Demo Required</label>
                            <textarea class="form-control custom-view-label" style="resize: none" id="demoReq" rows="3" data-bind="value: boothDemo"></textarea>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
            
        <!-- ------------------------------------------PROMOTION------------------------------------------ -->

        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#promotionCollapse">
                    <h6 class="p-4 custom-header">PROMOTION</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: promotionCheck"/>
                </label>
            </div>
            <div id="promotionCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-2">
                            <label for="bags">Bags</label>
                            <input type="text" class="form-control" id="bags" data-bind="value: bags"/>
                        </div>
                        <div class="form-group col-2">
                            <label for="pens">Pens</label>
                            <input type="text" class="form-control" id="pens" data-bind="value: pens"/>
                        </div>
                        <div class="form-group col-2">
                            <label for="notepads">Notepads</label>
                            <input type="text" class="form-control" id="notepads" data-bind="value: notepads"/>
                        </div>
                        <div class="form-group col-6">
                            <label for="additional">Additional</label>
                            <input type="text" class="form-control" id="additional" data-bind="value: additional"/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="disAddress">Dispatch address</label>
                            <input type="text" class="form-control" id="disAddress" data-bind="value: disAddress"/>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="form-group col-3">
                            <label for="promotionDate">Due date</label>
                            <input type="text" class="form-control" id="promotionDate" placeholder="" data-bind="datepicker: promotionDate"/>
                        </div>
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Dispatched: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: dispatched"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="note">Note</label>
                            <textarea class="form-control custom-view-label" style="resize: none" id="note" rows="3" data-bind="value: note"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ------------------------------------------CONTRACT------------------------------------------ -->

        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#contractCollapse">
                    <h6 class="p-4 custom-header">CONTRACT</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: contractCheck"/>
                </label>
            </div>
            <div id="contractCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="contractPrice">Contract Price</label>
                            <div class="input-group">
                                <input type="text" class="form-control" style="float: left;width: initial;" id="contractPrice" data-bind="value: contractPrice" >
                                <select class="form-control" style="float: left;width: initial;" data-bind="options: availableCurrency, value: currency">
					            </select>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                VAT Included: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: VATIncluded"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-4">
                            <label for="draftContractDate">Draft contract date</label>
                            <input type="text" class="form-control" id="draftContractDate" data-bind="datepicker: draftContractDate"/>
                        </div>
                        <div class="form-group col-4">
                            <label for="contractAcceptedDate">Contract accepted date</label>
                            <input type="text" class="form-control" id="contractAcceptedDate" data-bind="datepicker: contractAcceptedDate"/>
                        </div>
                        <div class="form-group col-4">
                            <label for="invoiceDate">Invoice date</label>
                            <input type="text" class="form-control" id="invoiceDate" data-bind="datepicker: invoiceDate"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ------------------------------------------EVENT DOCUMENTATION------------------------------------------ -->

        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label>
                    <h6 class="p-4 custom-header">EVENT DOCUMENTATION</h6> 
                </label>
            </div>
            <div id="eventDocCollapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">                  
                            <div class="form-group">
                                <label class="checkbox-inline">
                                Booth photo: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: boothPhoto"></label>
                            </div>
                        </div>
                        <div class="col-6">                  
                            <div class="form-group">
                                <label class="checkbox-inline">
                                Logo in abstract book: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: logoCollection"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">                  
                            <div class="form-group">
                                <label class="checkbox-inline">
                                Logo web: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: logoOnWeb"></label>
                            </div>
                        </div>
                        <div class="col-6">                  
                            <div class="form-group">
                                <label class="checkbox-inline">
                                Conference agenda: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: conferenceAgenda"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- ------------------------------------------CLOSING------------------------------------------ -->

        <div class="row d-flex justify-content-end" style="margin-top:20px; padding-right: 25px">
            <div style="text-align: right; position: relative; " >
                <div class="form-group">
                    <label class="checkbox-inline" style="font-size: 25px;">
                    Send for approval: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: approval"></label>
                </div>
                <button type="button" data-bind="click: save" class="btn btn-success">Save</button>
                <button type="button" data-bind="click: closeForm" class="btn btn-secondary" >Close</button>
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Application Page
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >

</asp:Content>
