<%@ Page Title="" Language="C#" MasterPageFile="~/ViewMaster.Master" AutoEventWireup="true" CodeBehind="EMICalculate.aspx.cs" Inherits="BiduthKarmi.EMICalculate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentTitle" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentHead" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentBody" runat="server">
    <div class="container">
        <br />
        <br />
    <!-- EMI Calculator Widget START --><script src="https://emicalculator.net/widget/2.0/js/emicalc-loader.min.js" type="text/javascript"></script><div id="ecww-widgetwrapper" style="min-width:250px;width:100%;"><div id="ecww-widget" style="position:relative;padding-top:0;padding-bottom:280px;height:0;overflow:hidden;"></div><div id="ecww-more" style="background:#333;font:normal 13px/1 Helvetica, Arial, Verdana, Sans-serif;padding:10px 0;color:#FFF;text-align:center;width:100%;clear:both;margin:0;clear:both;float:left;"><a style="background:#333;color:#FFF;text-decoration:none;border-bottom:1px dotted #ccc;" href="https://emicalculator.net/" title="Loan EMI Calculator" rel="nofollow" target="_blank">emicalculator.net</a></div></div><!-- EMI Calculator Widget END -->

    </div>
    <div class="container">
        <br />
        <br />
        <div class="row">
            <div class="span3">
                <div class="">
                    <iframe src="https://www.ashesh.com.np/forex/widget2.php?api=3112z0k447&header_color=38b45e&background_color=faf8ee&header_title=Nepal%20Exchange%20Rates" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="border: none; overflow: hidden; width: 100%; height: 383px; border-radius: 5px;" allowtransparency="true"></iframe>
                    <br />
                    <span style="text-align: left">© <a href="https://www.ashesh.com.np/forex/" title="Forex Nepal for Nepalese Rupee" target="_top" style="text-decoration: none;">Forex Nepal</a></span>

                </div>
            </div>
            <%--<div class="span4 offset1">
                <div class="row"    style="background-color:#0094ff;border-radius: 10px;">
                    <br/>
                    <div class="span12">
                        <input style="border-radius: 10px; height: 30px; width: 300px;" id="InputAmount" placeholder="Enter Amount" /><br/>
                        <input style="border-radius: 10px; height: 30px; margin-top: 10px; width: 300px;" id="InputRate" placeholder="Interest Rate" /><br/>
                        <input style="border-radius: 10px; height: 30px; margin-top: 10px; width: 300px;" id="InputYear" placeholder="Number of Year" /><br/>
                        <button class="btn btn-primary btn-user btn-sm" id="Proceed" style="margin-top: 10px;">Proceed</button>
                        <br/>
                         <br/>
                       <span    style="color:black">Note: This site is under construction.</span> 
                        <br/>
                        <br/>
                       
                    </div>
                </div>
                 <div class="row">
                    <div class="span6">
                          <br/>
                        <span  style="margin-top: 10px;color:yellow;font-size:20px;font-weight:bold">Result :</span>
                         <span id="output" style="margin-top: 10px;color:yellow;font-size:20px;font-weight:bold"></span>
                    </div>
                </div>
            </div>--%>

            <div class="span3   offset1">
                <iframe src="https://www.hamropatro.com/widgets/calender-medium.php" frameborder="0" scrolling="no" marginwidth="0" marginheight="0" style="border: none; overflow: hidden; width: 295px; height: 385px;" allowtransparency="true"></iframe>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentScript" runat="server">
    <script>

        $("#Proceed").on('click', function (e) {
            debugger;
            e.preventDefault();
            var Amount = $("#InputAmount").val();
            var Rate = $("#InputRate").val();
            var Year = $("#InputYear").val();

            var P = parseInt(Amount);
            var r = parseInt(Rate) / 100;
            var n = parseInt(Year) * 12;
            var d = P * r;
            var dd = (1 + r) ^ n;
            var dr = (1 + r) * n
            var a = ((1 + r) ^ n);
            var c = (((1 + r) ^ n) - 1);

            var EMI = P*r*a / c;

            $("#output").html(EMI);
        })




    </script>
</asp:Content>
