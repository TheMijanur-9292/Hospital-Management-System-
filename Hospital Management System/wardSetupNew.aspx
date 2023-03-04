<%@ Page Title="" Language="C#" MasterPageFile="~/ipd/ipd.master" AutoEventWireup="true" CodeFile="wardSetupNew.aspx.cs" Inherits="ipd_Default11" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <section class="inner-page">
        <div  id="contact" class="contact">
            <div class="container" data-aos="fade-up">
                    <h5 style="color:#006699">Add/Update Ward Details</h5>
                <div class="php-email-form">
                    <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <asp:Label ID="Label1" runat="server" Text="Ward Name"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ForeColor="Red" ControlToValidate="txtwardname">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:TextBox ID="txtwardname" runat="server" class="form-control" Font-Bold="true" Height="37px"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-2">
                                <div class="form-group">
                                    <asp:Label ID="Label2" runat="server" Text="Floor"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtfloor" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:TextBox ID="txtfloor" runat="server" class="form-control" Font-Bold="true" Height="37px"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-2">
                                <div class="form-group">
                                    <asp:Label ID="Label3" runat="server" Text="Building Name"></asp:Label>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtbuildnm" ForeColor="Red">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <asp:TextBox ID="txtbuildnm" runat="server" class="form-control" Font-Bold="true" Height="37px"></asp:TextBox> 
                                </div>
                            </div>
                            
                        </div>
                        <div class="row">
                           
                            <div class="col-md-2">
                                <div class="form-group">

                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">

                                </div>
                            </div>
                        </div>
                </div>
                <br />
                <div class="row">
                    <div class="col-md-2">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:consql %>" InsertCommand="INSERT INTO warddetails(wardname, floor, buildnm, centerid) VALUES (@wardname, @floor, @buildnm, @centerid)" ProviderName="<%$ ConnectionStrings:consql.ProviderName %>" OnInserted="SqlDataSource1_Inserted">
                            <InsertParameters>
                                <asp:ControlParameter ControlID="txtwardname" Name="wardname" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtfloor" Name="floor" PropertyName="Text" />
                                <asp:ControlParameter ControlID="txtbuildnm" Name="buildnm" PropertyName="Text" />
                                <asp:SessionParameter Name="centerid" SessionField="centerid" />
                            </InsertParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6">
                                
                    </div>
                    <div class="col-md-4">
                        <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="fbtn112" OnClick="btnsave_Click" />
                        <asp:Button ID="btncancel" runat="server" Text="Cancel" CssClass="fbtn113" PostBackUrl="~/ipd/wardSetupDetails.aspx" CausesValidation="False" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>