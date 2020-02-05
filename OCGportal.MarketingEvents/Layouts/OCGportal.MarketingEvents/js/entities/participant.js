define(["knockout", "kobindings", "helpers"], function (ko) {
    participant = function () {
        var self = this;

        self.rowID = ko.observable();

        self.user = ko.observableArray();
        self.accommodation = ko.observable(true);
        self.accommodationFrom = ko.observable();
        self.accommodationTo = ko.observable();
        self.booked = ko.observable();
    }
});

