<%@ Page Title="" Language="C#" MasterPageFile="~/AdminMaster.Master" AutoEventWireup="true" CodeBehind="MessageCenter.aspx.cs" Inherits="BiduthKarmi.MessageCenter" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Contenthead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentNavTitle" runat="server">
    Message Center
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentPlaceBody" runat="server">
    <div class="container">
        <asp:DropDownList ID="ddlMail" runat="server" CssClass="btn btn-default">
            <asp:ListItem Text="Action"></asp:ListItem>
            <asp:ListItem Text="Mark as Read"></asp:ListItem>
            <asp:ListItem Text="Delete"></asp:ListItem>
        </asp:DropDownList>
        <div class="container">
            <div class="modal fade" id="myModal" role="dialog">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5>SenderName  :&nbsp;</h5>
                            <%--<h4 style="padding-top: 0px;"></h4>--%>
                            <span  id="SenderName"style="padding-top: 2px;"></span>
                            &nbsp;&nbsp;<h5>Date :</h5>
                            &nbsp;<h6 class="modal-title" style="padding-top: 2px;"></h6>
                            <h5 class="modal-title" style="padding-top: 5px; color: blue"></h5>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>

                        </div>
                        <div class="modal-body">
                           Sender Email:&nbsp;<span   id="Senderemail"><br /></span> <h5>Message</h5>
                            <p style="padding-top: 10px; color: #100f0f"></p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="ModelClose" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <table class="table  table-responsive table-hover table-bordered" id="TableMain">
            <thead>
                <tr>
                    <th>
                        <asp:CheckBox ID="CheckAll" runat="server" Style="display: none" /></th>
                    <th style="width: 1000px">Subject</th>
                    <th style="width: 300px">Date</th>
                    <th style="width: 500px">
                        <span id="S1" class="btn btn-primary btn-xs" title="Mark As Read"><i class="fa fa-eye fa-sx "></i></span>
                        <span id="S0" class="btn btn-danger btn-xs" title="Delete All Message"><i class="fa fa-trash fa-xs"></i></span>
                        <span id="S2" class="btn btn-info btn-xs" title="Move to Trash"><i class="fa fa-pencil fa-xs"></i></span>
                    </th>
                </tr>
            </thead>
            <tbody id="MailBody">
            </tbody>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ContentScript" runat="server">
    <script type="text/javascript">
        function blockUI() {
            $.blockUI({ message: '<h5 class="lighter blue"><i class="fa fa-spinner fa-spin"></i> Please wait while we perform your request.</h5>' });
        }
        function unblockUI() {
            $.unblockUI();
        }
        function AjaxEnd(sender, args) {
            unblockUI();
        }
        function AjaxBegin(sender, args) {
            blockUI();
        }
        $(document).ready(function () {
            PageLoad();
        });

        function PageLoad() {
            $.ajax({
                type: "POST",
                url: "MessageCenter.aspx/LoadMail",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (response) {
                    $("#TableMain tbody").prepend(response.d);
                    Run();
                    //$(row).prepend(response.d);
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }


        function Delete(element) {
            var row = $(element).closest("tr");
            var id = $(row).attr("id");
            if (confirm("Do you want to delete?")) {

                $.ajax({
                    type: "POST",
                    url: "MessageCenter.aspx/DeleteMessage",
                    data: JSON.stringify({ MailID: id }),
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                    complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                    success: function (result) {
                        //PageLoad();
                        row.remove();
                        Run();
                    },
                    failure: function (response) {
                        alert(response.d);
                    }
                });
            }
        }
        function Read(element) {
            var row = $(element).closest("tr");
            var id = $(row).attr("id");
            $.ajax({
                type: "POST",
                url: "MessageCenter.aspx/ReadMail",
                data: JSON.stringify({ MailID: id }),
                contentType: "application/json; charset=utf-8",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                dataType: "json",

                success: function (result) {
                    if (result.d.Success == true) {
                        $("p:last").html(result.d.Message);
                        $("#SenderName").html(result.d.Data);
                        $("h6:last").html(result.d.AdditionalData);
                        $("#Senderemail").html(result.d.AdditionalMessage);
                        row.remove();
                        $("#TableMain tbody").append(result.d.AlertMessage);
                    }
                    Run();

                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        }

        function Reply(element) {
            //var row = $(element).closest("tr");
            //var id = $(row).attr("id");
            //alert(id);

        }

        $(document).on("click", "#ModelClose", function (e) {
            $("#ModalHeader").val('');
            $("#ModalBody").val('');
        });

        function Run() {
            $(".btn-light").hide();
            $("#S0").hide();
            $("#S1").hide();
            $("#S2").hide();
            var thistr = '';
            $("tr").mouseenter(function () {
                if ($("#<%=CheckAll.ClientID%>").prop("checked") == false) {
                    thistr = $(this).closest("tr");
                }
                thistr.find(".btn-light").show();
            });
            $("tr").mouseleave(function () {
                $(".btn-light").hide();

            });
        };
        $(document).on('click', '#S1', function () {
            $.ajax({
                type: "POST",
                url: "MessageCenter.aspx/MarkAllRead",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    Run()
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        })
        $(document).on('click', '#S2', function () {
            alert("Move");
        })
        $(document).on('click', '#S0', function () {
            $.ajax({
                type: "POST",
                url: "MessageCenter.aspx/DeleteAllMessage",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                beforeSend: function (jqXHR, settings) { blockUI(jqXHR, settings) },
                complete: function (jqXHR, textStatus) { unblockUI(jqXHR, textStatus) },
                success: function (result) {
                    Run();
                },
                failure: function (response) {
                    alert(response.d);
                }
            });
        })

        //$(document).ready(function () {
        //    $(".btn-light").click(function () {
        //        if ($(this).hasClass("Delete")) {
        //            alert("Delete");
        //        }
        //        else if ($(this).hasClass("Read")) {
        //            alert("Read");
        //        }
        //        else if ($(this).hasClass("Reply")) {
        //            alert("Reply");
        //        }
        //    });
        //});
        $(document).ready(function () {
            $("#<%=CheckAll.ClientID%>").click(function () {
                if ($("#<%=CheckAll.ClientID%>").prop("checked") == true) {
                    $("#TableMain tr:not(:first)").each(function () {
                        $('.check').prop('checked', true);
                        //$('.check').find('>:first-child').prop('checked', true);
                    })
                    $("#S0").show();
                    $("#S1").show();
                    $("#S2").show();
                }
                else {
                    $("#TableMain tr:not(:first)").each(function () {
                        $('.check').prop('checked', false);
                        //$('.check').find('>:first-child').prop('checked', false);
                        $("#S0").hide();
                        $("#S1").hide();
                        $("#S2").hide();
                    })
                }
            });
        });
    </script>
</asp:Content>
