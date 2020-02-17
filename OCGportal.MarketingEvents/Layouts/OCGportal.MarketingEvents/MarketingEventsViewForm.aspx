﻿<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Import Namespace="Microsoft.SharePoint.ApplicationPages" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MarketingEventsViewForm.aspx.cs" Inherits="OCGportal.MarketingEvents.Layouts.OCGportal.MarketingEvents.MarketingEventsViewForm" DynamicMasterPageFile="~masterurl/default.master" %>

<asp:Content ID="PageHead" ContentPlaceHolderID="PlaceHolderAdditionalPageHead" runat="server">
    <script type="text/javascript" src="/_layouts/15/OCGportal.MarketingEvents/js/libs/require.js" data-main="/_layouts/15/OCGportal.MarketingEvents/js/viewFormViewModel"></script>
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
    <div id="MarketingEventsForm" class="container-fluid" style="display:none" data-bind="visible: isInitialized">
        <div class="row d-flex justify-content-start" style="margin-top:20px; padding-right: 25px">
            <div style="text-align: right; position: relative; " >
                <button type="button" class="btn btn-success" data-bind="click: edit, visible: canEdit" style="display:none">Edit</button>
                <button type="button" data-bind="click: closeForm" class="btn btn-secondary" >Close</button>
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="form-group col-2">
                <label for="company">Company</label>
                <input type="text" class="form-control custom-view-label" id="company" data-bind="value: company" disabled/>
            </div>
            <div class="form-group col-5">
                <label for="eventProvider">Event Provider</label>
                <input type="text" class="form-control custom-view-label" id="eventProvider" data-bind="value: eventProvider" disabled/>
            </div>
            <div class="form-group col-5">
                <label for="status">Status</label>
                <input type="text" class="form-control custom-view-label" id="status" data-bind="value: status" disabled/>
            </div>
        </div>

        <div class="row">
            <div class="col-6" style="padding-left:0px;">
                <div class="form-group col-12">
                    <label for="title">Event Title</label>
                    <input type="text" class="form-control custom-view-label" id="title" data-bind="value: title" disabled/>
                </div>
                <div class="form-group col-6">
                    <label for="startDate">Start Date</label>
                    <input type="text" class="form-control custom-view-label" id="startDate" placeholder="Start Date" data-bind="datepicker: startDate" disabled/>
                </div>
                <div class="row" style="padding-left:15px; padding-right:15px">
                    <div class="form-group col-6">
                        <label for="endDate">End Date</label>
                        <input type="text" class="form-control custom-view-label" id="endDate" placeholder="End Date" data-bind="datepicker: endDate" disabled/>
                    </div>
                    <div class="form-group col-6">
                        <label for="fiscalYear">Fiscal Year</label>
                        <input type="text" class="form-control custom-view-label" id="fiscalYear" placeholder="End Date" data-bind="value: fiscalYear" disabled/>
                    </div>
                </div>
                <div class="row" style="padding-left:15px; padding-right:15px">
                    <div class="form-group col-6">
                        <label for="city">City</label>
                        <input type="text" class="form-control custom-view-label" id="city" data-bind="value: city" disabled/>
                    </div>
                    <div class="form-group col-6">
                        <label for="country">Country</label>
                        <input type="text" class="form-control custom-view-label" id="country" data-bind="value: country" disabled/>
                    </div>
                </div>
                <div class="form-group col-12">
                    <label for="organizator">Event Organizator</label>
                    <input type="text" class="form-control custom-view-label" id="organizator" data-bind="value: organizator" disabled/>
                </div>
                <div class="form-group col-12">
                    <label for="contact">On-Site Contact</label>
                    <input type="text" class="form-control custom-view-label" id="contact" data-bind="value: contact" disabled/>
                </div>
                <div class="form-group col-12">
                    <label for="internalIntermediary">Internal Intermediary</label>
                    <!--<input type="text" class="form-control custom-view-label" id="internalIntermediary" data-bind="value: internalIntermediary" disabled/>-->
                    <div id="internalIntermediary" style="width: auto; height: auto" data-bind="clientPeoplePicker: { data: internalIntermediary, options: { AllowMultipleValues: false } }" disabled></div>
                </div>
            </div>
            <div class="col-3" style="padding-left:0px;">
                <h6 class="text-left">Marketing Groups</h6>
                <hr />
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="MarketingGroupsIB" data-bind="checked: marketingGroupsIB" disabled>
                    <label class="form-check-label" for="MarketingGroupsIB">
                        IB
                    </label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="MarketingGroupsLS" data-bind="checked: marketingGroupsLS" disabled>
                    <label class="form-check-label" for="MarketingGroupsLS">
                        LS
                    </label>
                </div>
                <br />
                <br />
                <div class="form-group col-12">
                    <label for="marketingGroupsLSShare">LS</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="marketingGroupsLSShare" data-bind="value: marketingGroupsLSShare" disabled/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>                
                <div class="form-group col-12">
                    <label for="marketingGroupsMFShare">MF</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="marketingGroupsMFShare" data-bind="value: marketingGroupsMFShare" disabled/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>
                <div class="form-group col-12">
                    <label for="marketingGroupsMTShare">MT</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="marketingGroupsMTShare" data-bind="value: marketingGroupsMTShare" disabled/>
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
                    <input type="text" class="form-control custom-view-label" id="registration" placeholder="Registration" data-bind="datepicker: registration" disabled/>
                </div>
            </div>
            <div class="col-3" style="padding-left:0px;">
                <h6 class="text-left">Product Groups</h6>
                <hr />
                <div class="form-group col-12">
                    <label for="ProdGroupLSShare">LS</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="ProdGroupLSShare" data-bind="value: prodGroupLSShare" disabled/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div><div class="form-group col-12">
                    <label for="ProdGroupIEShare">IE</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="ProdGroupIEShare" data-bind="value: prodGroupIEShare" disabled/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>                
                <div class="form-group col-12">
                    <label for="ProdGroupNDTShare">NDT</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="ProdGroupNDTShare" data-bind="value: prodGroupNDTShare" disabled/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>                
                <div class="form-group col-12">
                    <label for="ProdGroupRVIShare">RVI</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="ProdGroupRVIShare" data-bind="value: prodGroupRVIShare" disabled/>
                        <div class="input-group-append">
                            <span class="input-group-text">%</span>
                        </div>
                    </div>
                </div>                
                <div class="form-group col-12">
                    <label for="ProdGroupANIShare">ANI</label>
                    <div class="input-group">
                        <input type="text" class="form-control custom-view-label" id="ProdGroupANIShare" data-bind="value: prodGroupANIShare" disabled/>
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
                <input type="text" class="form-control custom-view-label" id="DocFolder" data-bind="value: docFolder" disabled/>
            </div>
        </div>

        <!-- ------------------------------------------PARTICIPANTS------------------------------------------ -->
        

        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#participantsCollapse">
                    <h6 class="p-4 custom-header">PARTICIPANTS</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: participantsCheck" disabled/>
                </label>
            </div>
            <div id="participantsCollapse" class="collapse" >
                <div class="card-body">
                    <table class="table table-hover">
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
                            <tr data-bind="hidden: deleted">
                                <td style="width: 225px; height: 45px;">
                                    <div class="generated_peoplepicker" style="width: auto; height: auto" data-bind="clientPeoplePicker: { data: user, options: { AllowMultipleValues: false } }" disabled></div>
                                </td>
                                <td style="text-align: center;">
                                    <input type="checkbox" data-bind="checked: accommodation" style="width: 15px; height: 15px;" disabled/>
                                </td>
                                <td>
                                    <input type="text" class="custom-view-label" data-bind="datepicker: accommodationFrom, visible: accommodation" style="width: 100%" disabled/>
                                </td>
                                <td>
                                    <input type="text" class="custom-view-label" data-bind="datepicker: accommodationTo, visible: accommodation" style="width: 100%" disabled/>
                                </td>
                                <td style="text-align: center;">
                                    <input type="checkbox" class="custom-view-label" data-bind="checked: booked, visible: accommodation" style="width: 15px; height: 15px;" disabled/>
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
                    <h6 class="p-4 custom-header">CONTRIBUTION</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: contributionCheck" disabled/>
                </label>
            </div>
            <div id="contributionCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="contributionName">Title</label>
                            <input type="text" class="form-control custom-view-label" id="contributionName" data-bind="value: contributionName" disabled/>
                        </div>
                        <div class="form-group col-4">
                            <label for="contributionTime">Date/Time</label>
                            <input type="text" class="form-control custom-view-label" id="contributionTime" data-bind="datetimepicker: contributionTime" disabled/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ------------------------------------------ADVERTISEMENT------------------------------------------ -->
            
        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#advertismentCollapse">
                    <h6 class="p-4 custom-header">ADVERTISEMENT</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: advertismentCheck" disabled/>
                </label>
            </div>
            <div id="advertismentCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="advertismentTopic">Topic</label>
                            <input type="text" class="form-control custom-view-label" id="advertismentTopic" data-bind="value: advertismentTopic" disabled/>
                        </div>
                        <div class="form-group col-3">  
                            <label for="advertismentDeliveryDate">Until</label>
                                <input type="text" class="form-control custom-view-label" id="advertismentDeliveryDate" data-bind="datepicker: advertismentDeliveryDate" disabled/>
                        </div>
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Delivered: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: delivered" disabled></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Logo on web: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: webLogo" disabled></label>
                            </div>
                        </div>
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Logo in abstract book: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: bookLogo" disabled></label>
                            </div>
                        </div>
                        <div class="form-group col-3">  
                            <label for="advertismentFormat">Format</label>
                            <input type="text" class="form-control custom-view-label" id="advertismentFormat" data-bind="value: advertismentFormat" disabled/>
                        </div>
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Banner: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: banner" disabled></label>
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
                    <h6 class="p-4 custom-header">BOOTH</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: boothCheck" disabled/>
                </label>
            </div>
            <div id="boothCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-8">
                            <label for="specification">Specification</label>
                            <input id="specification" type="text" class="form-control custom-view-label" data-bind="value: specification" disabled/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="comment">Comment</label>
                            <textarea class="form-control custom-view-label" style="resize: none" id="comment" rows="3" data-bind="value: boothComment" disabled></textarea>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="demoReq">Demo Required</label>
                            <textarea class="form-control custom-view-label" style="resize: none" id="demoReq" rows="3" data-bind="value: boothDemo" disabled></textarea>
                        </div>
                    </div>                    
                </div>
            </div>
        </div>
            
        <!-- ------------------------------------------PROMOTION------------------------------------------ -->

        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#promotionCollapse">
                    <h6 class="p-4 custom-header">PROMOTION</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: promotionCheck" disabled/>
                </label>
            </div>
            <div id="promotionCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-2">
                            <label for="bags">Bags</label>
                            <input type="text" class="form-control custom-view-label" id="bags" data-bind="value: bags" disabled/>
                        </div>
                        <div class="form-group col-2">
                            <label for="pens">Pens</label>
                            <input type="text" class="form-control custom-view-label" id="pens" data-bind="value: pens" disabled/>
                        </div>
                        <div class="form-group col-2">
                            <label for="notepads">Notepads</label>
                            <input type="text" class="form-control custom-view-label" id="notepads" data-bind="value: notepads" disabled/>
                        </div>
                        <div class="form-group col-6">
                            <label for="additional">Additional</label>
                            <input type="text" class="form-control custom-view-label" id="additional" data-bind="value: additional" disabled/>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="disAddress">Dispatch address</label>
                            <input type="text" class="form-control custom-view-label" id="disAddress" data-bind="value: disAddress" disabled/>
                        </div>
                    </div>
                    <div class="row justify-content-between">
                        <div class="form-group col-3">
                            <label for="promotionDate">Due date</label>
                            <input type="text" class="form-control custom-view-label" id="promotionDate" placeholder="" data-bind="datepicker: promotionDate" disabled/>
                        </div>
                        <div class="col-3">                  
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                Dispatched: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: dispatched" disabled></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-12">
                            <label for="note">Note</label>
                            <textarea class="form-control custom-view-label" style="resize: none" id="note" rows="3" data-bind="value: note" disabled></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- ------------------------------------------CONTRACT------------------------------------------ -->

        <div class="card d-flex justify-content-start">
            <div class="card-header">
                <label data-toggle="collapse" data-target="#contractCollapse">
                    <h6 class="p-4 custom-header">CONTRACT</h6> <input class="p-2" style="display: inline" type="checkbox" data-bind="checked: contractCheck" disabled/>
                </label>
            </div>
            <div id="contractCollapse" class="collapse" >
                <div class="card-body">
                    <div class="row">
                        <div class="form-group col-6">
                            <label for="contractPrice">Contract Price</label>
                            <div class="input-group">
                                <input type="text" class="form-control custom-view-label" style="float: left;width: initial;" id="contractPrice" data-bind="value: contractPrice" disabled>
                                <div class="input-group-append">
                                    <span class="input-group-text" data-bind="text: currency"></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="form-group">
                                <br />
                                <label class="checkbox-inline">
                                VAT Included: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: VATIncluded" disabled></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="form-group col-4">
                            <label for="draftContractDate">Draft contract date</label>
                            <input type="text" class="form-control custom-view-label" id="draftContractDate" data-bind="datepicker: draftContractDate" disabled/>
                        </div>
                        <div class="form-group col-4">
                            <label for="contractAcceptedDate">Contract accepted date</label>
                            <input type="text" class="form-control custom-view-label" id="contractAcceptedDate" data-bind="datepicker: contractAcceptedDate" disabled/>
                        </div>
                        <div class="form-group col-4">
                            <label for="invoiceDate">Invoice date</label>
                            <input type="text" class="form-control custom-view-label" id="invoiceDate" data-bind="datepicker: invoiceDate" disabled/>
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
                                Booth photo: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: boothPhoto" disabled></label>
                            </div>
                        </div>
                        <div class="col-6">                  
                            <div class="form-group">
                                <label class="checkbox-inline">
                                Logo in abstract book: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: logoCollection" disabled></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-6">                  
                            <div class="form-group">
                                <label class="checkbox-inline">
                                Logo web: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: logoOnWeb" disabled></label>
                            </div>
                        </div>
                        <div class="col-6">                  
                            <div class="form-group">
                                <label class="checkbox-inline">
                                Conference agenda: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: conferenceAgenda" disabled></label>
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
                    Send for approval: <input type="checkbox" style="display: inline-block;" value="" data-bind="checked: approval" disabled></label>
                </div>
                <button type="button" data-bind="click: closeForm" class="btn btn-secondary" >Close</button>
            </div>
        </div>

    </div>
</asp:Content>

<asp:Content ID="PageTitle" ContentPlaceHolderID="PlaceHolderPageTitle" runat="server">
Marketing event view form
</asp:Content>

<asp:Content ID="PageTitleInTitleArea" ContentPlaceHolderID="PlaceHolderPageTitleInTitleArea" runat="server" >

</asp:Content>
