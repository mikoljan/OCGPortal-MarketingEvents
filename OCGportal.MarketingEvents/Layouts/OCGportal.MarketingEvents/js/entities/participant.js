define(["knockout", "kobindings", "helpers"], function (ko) {
    participant = function () {
        var self = this;

        self.rowID = ko.observable();
        self.isNew = ko.observable(true);
        self.deleted = ko.observable(false);

        self.user = ko.observableArray();
        self.accommodation = ko.observable(true);
        self.accommodationFrom = ko.observable();
        self.accommodationTo = ko.observable();
        self.booked = ko.observable();

        // Temporary deletes participant
        self.deleteParticipant = function () {
            self.deleted(true);
        }

    }
});

