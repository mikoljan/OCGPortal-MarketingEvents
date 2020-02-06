define(["knockout", "kobindings", "helpers"], function (ko) {
    participant = function () {
        var self = this;

        self.rowID = ko.observable();
        self.isNew = ko.observable(true);
        self.deleted = ko.observable(false);
        
        self.user = ko.observableArray();
        self.userID = ko.observable();
        self.userIDCompute = ko.computed(function () {

            if (self.user()[0]) {
                var userFnc = self.getUserIdFromLogin(self.user()[0]);
                userFnc.then(function (driverID) {
                    self.userID(driverID);
                });
            } else {
                self.userID(null);
            }
        }, this);

        self.accommodation = ko.observable(true);
        self.accommodationFrom = ko.observable();
        self.accommodationTo = ko.observable();
        self.booked = ko.observable();
        self.participantID = ko.observable();

        // Temporary deletes participant
        self.deleteParticipant = function () {
            self.deleted(true);
        }

        self.getUserIdFromLogin = function (loginName) {
            var context = SP.ClientContext.get_current();
            var spuser = context.get_web().ensureUser(loginName);
            console.log("Finding by login name: " + loginName);
            context.load(spuser);

            return executeQueryAsyncDeferred(context, null).then(function () {
                return spuser.get_id();
            });
        }

    }
});

