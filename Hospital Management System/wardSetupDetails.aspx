<%@ Page Title="" Language="C#" MasterPageFile="~/ipd/ipd.master" AutoEventWireup="true" CodeFile="wardSetupDetails.aspx.cs" Inherits="ipd_Default10" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <section class="inner-page">
        <div  id="contact" class="contact">
            <div class="container" data-aos="fade-up">
               <h5 style="color:#006699">Ward Details</h5>
                    <div class="row">
                        <div class="col-sm-2">
                            <asp:Label ID="Label1" runat="server" Text="Ward Name"></asp:Label>
                            
                        </div>
                        <div class="col-sm-4">
                              <asp:TextBox ID="txtwardname" runat="server" class="form-control" placeholder="Type to Search" Font-Bold="true" CausesValidation="True"></asp:TextBox>
                          <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" TargetControlID="txtwardname" ServiceMethod="getlist" UseContextKey="true" MinimumPrefixLength="1" CompletionInterval="10" CompletionSetCount="10"></ajaxToolkit:AutoCompleteExtender>

                        </div>
                        <div class="col-sm-4">
                            <asp:Button ID="btnsearch" runat="server" Text="Search" CssClass="fbtn112"  />
                        </div>
                        <div class="col-md-2">
                            <asp:Button ID="btnaddnew" runat="server" Text="Add New" CssClass="fbtn112" PostBackUrl="~/ipd/wardSetupNew.aspx" />
                        </div>
                    </div>
                <br />
                <div style="overflow-x:scroll; border-top:3px solid #eb5d1e; border-bottom:3px solid #eb5d1e">
                    
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CellPadding="4" ForeColor="#333333" GridLines="None" Width="1475px" AllowPaging="True" AllowSorting="True">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="wardname" HeaderText="Ward Name" SortExpression="wardname" readonly="true"/>
                            <asp:BoundField DataField="floor" HeaderText="Floor" SortExpression="floor" />
                            <asp:BoundField DataField="buildnm" HeaderText="Building Name" SortExpression="buildnm" />

                            <asp:TemplateField>
                                <ItemTemplate >
                                    <asp:ImageButton ID="imgbtn" runat="server" AlternateText="Delete"  />
                                    <ajaxToolkit:ConfirmButtonExtender ID="ConfirmButtonExtender1" runat="server" TargetControlID="imgbtn" DisplayModalPopupID="ModalPopupExtender1" />
                                    <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" runat="server" TargetControlID="imgbtn" OkControlID="btnyes" CancelControlID="btnno" PopupControlID="Panel1"></ajaxToolkit:ModalPopupExtender>
                                    <asp:Panel ID="Panel1" runat="server" style="display:none; background-color:aliceblue; width:300; border-width:2px; border-color:black; border-style:solid;padding:2px;align-content:center">
                                        Are you sure you want to delete the record?<br />
                                        <asp:Button ID="btnyes" runat="server" Text="Yes" CssClass="fbtn112" />
                                        <asp:Button ID="btnno" runat="server" Text="No" CssClass="fbtn113" />
                                         </asp:Panel>

                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField></asp:TemplateField>

                        </Columns>
                       
                        <EditRowStyle BackColor="#999999" />
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <SortedAscendingCellStyle BackColor="#E9E7E2" />
                        <SortedAscendingHeaderStyle BackColor="#506C8C" />
                        <SortedDescendingCellStyle BackColor="#FFFDF8" />
                        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                       
                    </asp:GridView>
                    
                </div>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <div class="row">
                    <div class="col-md-2">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:consql %>" ProviderName="<%$ ConnectionStrings:consql.ProviderName %>" SelectCommand="SELECT wardname, floor, buildnm  FROM warddetails WHERE (centerid = @centerid)" DeleteCommand="DELETE FROM warddetails WHERE (wardname = @wardname) AND (floor = @floor) AND (buildnm = @buildnm) AND (centerid = @centerid)" FilterExpression="wardname='{0}'" UpdateCommand="UPDATE warddetails SET floor = @floor, buildnm = @buildnm WHERE (centerid = @centerid) AND (wardname = @wardname)" OnSelecting="Page_Load" OnInserted="SqlDataSource1_Inserted">
                            <DeleteParameters>
                                <asp:Parameter Name="wardname" />
                                <asp:Parameter Name="floor" />
                                <asp:Parameter Name="buildnm" />
                                <asp:SessionParameter Name="centerid" SessionField="centerid" />
                            </DeleteParameters>
                            <FilterParameters>
                                <asp:ControlParameter ControlID="txtwardname" Name="wardname" PropertyName="Text" />
                            </FilterParameters>
                            <SelectParameters>
                                <asp:SessionParameter Name="centerid" SessionField="centerid" />
                            </SelectParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="floor" />
                                <asp:Parameter Name="buildnm" />
                                <asp:SessionParameter Name="centerid" SessionField="centerid" />
                                <asp:Parameter Name="wardname" />
                            </UpdateParameters>
                        </asp:SqlDataSource>        
                    </div>
                    <div class="col-md-8">
                                
                    </div>
                    <div class="col-md-2">
                        <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="fbtn113" OnClick="btnclear_Click" />
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>