using BusinessLayer;
using CommonLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using static CommonLayer.MessageExtension;

namespace BiduthKarmi
{
    public partial class AssociateBank : DJBaseClass
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (IsEditHiddenField.Value == "true")
            {
                var model = new ClassCollection()
                {
                    AssociateInfo = new AssociateBankDetails()
                    {
                        Id = SelectedIdHiddenField.Value.ToInt(),
                        BankName = BankNameTxtB.Text.Trim(),
                        AccountNumber = AccountNumberTxtB.Text.Trim(),
                        AccountHolderName = AccountHolderNameTxtB.Text.Trim(),
                        BranchName = BranchNameTxtB.Text.Trim(),
                        Logo = LogoUploaderFile.FileName.ToText(),


                    }
                };

                int i = AssociateBankService.UpdateAssociateBank(model);
                if (i > 0)
                {
                    BankNameTxtB.Text = string.Empty;
                    AccountHolderNameTxtB.Text = string.Empty;
                    AccountNumberTxtB.Text = null;
                    BranchNameTxtB.Text = string.Empty;
                    if (LogoUploaderFile.FileName.ToText() != string.Empty)
                    {
                        LogoUploaderFile.SaveAs(Server.MapPath("/Img/AssociateBankLogo/" + LogoUploaderFile.FileName));
                    }
                    ShowMessage("Update Successfully", new Success());
                    Response.Redirect("AssociateBank.aspx");
                }
            }
            else
            {
                var model = new ClassCollection()
                {
                    AssociateInfo = new AssociateBankDetails()
                    {
                        BankName = BankNameTxtB.Text.Trim(),
                        AccountNumber = AccountNumberTxtB.Text.Trim(),
                        AccountHolderName = AccountHolderNameTxtB.Text.Trim(),
                        BranchName = BranchNameTxtB.Text.Trim(),
                        Logo = LogoUploaderFile.FileName.ToText(),


                    }
                };

                int i = AssociateBankService.SaveAssociateBank(model);
                if (i > 0)
                {
                    BankNameTxtB.Text = string.Empty;
                    AccountHolderNameTxtB.Text = string.Empty;
                    AccountNumberTxtB.Text = string.Empty;
                    BranchNameTxtB.Text = string.Empty;
                    if (LogoUploaderFile.FileName.ToText() != string.Empty)
                    {
                        LogoUploaderFile.SaveAs(Server.MapPath("/Img/AssociateBankLogo/" + LogoUploaderFile.FileName));
                    }
                    ShowMessage("Save Successful", new Success());
                    Response.Redirect("AssociateBank.aspx");

                }
            }
          
        }

        [WebMethod]
        public static JSONObject LoodAssociateBankDetails()
        {
            var result = new JSONObject();
            var NewsList = "";
            var dt = AssociateBankService.GetAssociateBankLists();
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                foreach (DataRow dr in dt.Rows)
                {
                    NewsList += "<tr  id='a" + dr["Id"] + "'><td style='text-align:center; width:5%'>" + dr["Id"] + "</td><td style='text-align:center; width:15%;'>" + dr["BankName"] + "</td><td style='text-align:center; width:10%'>" + dr["AccountNumber"] + "</td><td style='text-align:center; width:10%'>" + dr["AccountHolderName"] + "</td><td style='text-align:center; width:10%'>" + dr["BranchName"] + "</td><td style='text-align:center; width:10%'>" + dr["Logo"] + "</td><td style='text-align:center; width:5%'>" + dr["IsActive"] + "</td>"
                       + "<td style='text-align:center; width:15%'><button id='c" + dr["Id"] + "' onclick=Active(this)   class='btn btn-success' type='button'><i class='fa fa-eye fa-xs'></i></button>&nbsp;<button id='c" + dr["Id"] + "' onclick=Edit(this)   class='btn btn-primary' type='button'><i class='fas fa-edit fa-xs'></i></button>&nbsp;<button id='b" + dr["Id"] + "' onclick=Delete(this) class='btn btn-danger' type='button'><i class='fa fa-trash fa-xs'></i></button></td></tr>";
                }
                result.Data = NewsList;
            }
            return result;
        }

        [WebMethod]
        public static JSONObject MakeInactive(string CID)
        {
            var result = new JSONObject();
            string NewsList = "";
            var dt = AssociateBankService.MakeInactive(CID.ToInt());
            if (dt.Rows.Count > 0)
            {

                result.Success = true;
                result.Data = NewsList;
            }
            else
            {
                result.Success = false;
            }

            return result;
        }

        [WebMethod]
        public static JSONObject EditAssociateBank(string CID)
        {
            var result = new JSONObject();
            result.Datas = new object[7];
            var dt = AssociateBankService.GetAssociateBankById(CID.ToInt());
            if (dt.Rows.Count > 0)
            {
                result.Success = true;
                result.Datas[0] = dt.Rows[0]["BankName"].ToText();
                result.Datas[1] = dt.Rows[0]["AccountNumber"].ToText();
                result.Datas[2] = dt.Rows[0]["AccountHolderName"].ToText();
                result.Datas[3] = dt.Rows[0]["BranchName"].ToText();
                result.Datas[4] = dt.Rows[0]["Logo"].ToText();

            }
            else
            {
                result.Success = false;
            }
            return result;
        }

        [WebMethod]
        public static JSONObject DeleteAssociateBank(string CID)
        {
            var result = new JSONObject();
            var dt = AssociateBankService.DeleteAssociateBank(CID.ToInt());
            if (dt > 0)
            {
                result.Success = true;
            }
            else
            {
                result.Success = false;
            }


            return result;
        }
    }

}