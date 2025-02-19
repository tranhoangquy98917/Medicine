<%-- 
    Document   : user-home
    Created on : Oct 28, 2023, 8:24:21 PM
    Author     : Nguyen Hoang Nha - CE170092
--%>

<%@page import="Model.UnitModel"%>
<%@page import="Daos.UnitProductDAO"%>
<%@page import="Model.UnitProductModel"%>
<%@page import="java.util.List"%>
<%@page import="jakarta.servlet.jsp.jstl.sql.Result"%>
<%@page import="Model.BrandModel"%>
<%@page import="Model.ProductModel"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Daos.ProductDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900&display=swap" rel="stylesheet">

        <title>Detail Product</title>
        <link rel="stylesheet" type="text/css" href="/resources/UserAssets/css/bootstrap.min.css">

        <link rel="stylesheet" type="text/css" href="/resources/UserAssets/css/font-awesome.css">

        <link rel="stylesheet" href="/resources/UserAssets/css/templatemo-hexashop.css">

        <link rel="stylesheet" href="/resources/UserAssets/css/owl-carousel.css">

        <link rel="stylesheet" href="/resources/UserAssets/css/lightbox.css">
        <!--/resources/jq.js-->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body>

        <%
            ProductModel p = (ProductModel) session.getAttribute("chitietsanpham");
            ResultSet rs = null;
            try {
                int pro_id = p.getProID();
                ProductDAO cDAO = new ProductDAO();
                rs = cDAO.getProduct2(pro_id);

                if (rs == null) {
                    response.sendRedirect("/UserHomeController");
                } else {

                }
            } catch (Exception ex) {
                System.out.println(ex);

                //    response.sendRedirect("/CustomerController");
            }

            List<UnitProductModel> unitItems = null;
            UnitProductDAO udD = new UnitProductDAO();
            unitItems = udD.getProductUnits(p.getProID());


        %>

        <jsp:include page="user-header.jsp" />
        <!-- ***** Header Area End ***** -->


        <!-- ***** Main Banner Area Start ***** -->
        <div class="" id="top">
            <div class="container">
                <!--                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="inner-content">
                
                                            <h2>Single Product Page</h2>
                                            <span>Awesome &amp; Creative HTML CSS layout by TemplateMo</span>
                                        </div>
                                    </div>
                                </div>-->
            </div>
        </div>
        <!-- ***** Main Banner Area End ***** -->


        <!-- ***** Product Area Starts ***** -->
        <section class="section b pt-5" id="product">
            <div class="container">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="left-images">
                            <img src='https://c8.alamy.com/comp/JM10B2/colorful-poster-in-white-background-with-medicine-bottle-in-closeup-JM10B2.jpg' alt="">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="right-content">
                            <h4><%=rs.getString("ProName")%></h4>
                            <input value="" id="unitId" />
                            <div class="btn-group btn-group-toggle" data-toggle="buttons">
                                <%
                                    for (UnitProductModel item : unitItems) {
                                        UnitModel um = udD.getUnitByID(item.getUnitID());
                                %>
                                <label class="btn btn-secondary active">
                                    <%=um.getUnitName()%>
                                    <input type="radio" name="options" onclick="showPrice(<%= item.getPrice()%>, <%= item.getUnitID()%>)" data-price="<%= item.getPrice()%>">
                                </label>
                                <% }%>
                            </div>
                            <span class="price" >
                                Giá: <span class="price" id="productPrice"></span>
                            </span>
                            <span>Description: <%= p.getProDescription()%></span>
                            <span>Type: <%=rs.getString("CateName")%></span>
                            <span>Brand: <%=rs.getString("BrandName")%></span>
                            <span>Element: <%=p.getElement()%></span>
                            <div class="quantity-content">
                                <div class="left-content">
                                    <h6>Quantity </h6>
                                </div>
                                <div class="right-content">
                                    <div class="quantity buttons_added">
                                        <input  type="button" value="-" class="minus"><input type="number" id="quan" step="1" min="1" max="" name="quantity" value="1" title="Qty" class="input-text qty text" size="4" pattern="" inputmode=""><input type="button" value="+" class="plus">
                                    </div>
                                </div>
                            </div>
                            <div class="total">
                                <h4>Total price: <h4 id="total1"></span></h4>
                                    <div class="main-border-button"><a onclick='addToCart(<%=p.getProID()%>)'>Thêm vào giỏ</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ***** Product Area Ends ***** -->

        <!-- ***** Footer Start ***** -->
        <footer>
            <div class="container">
                <div class="row">
                    <div class="col-lg-3">
                        <div class="first-item">
                            <div class="logo">
                                <img src="assets/images/white-logo.png" alt="hexashop ecommerce templatemo">
                            </div>
                            <ul>
                                <li><a href="#">16501 Collins Ave, Sunny Isles Beach, FL 33160, United States</a></li>
                                <li><a href="#">hexashop@company.com</a></li>
                                <li><a href="#">010-020-0340</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3">
                        <h4>Shopping &amp; Categories</h4>
                        <ul>
                            <li><a href="#">Men’s Shopping</a></li>
                            <li><a href="#">Women’s Shopping</a></li>
                            <li><a href="#">Kid's Shopping</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Useful Links</h4>
                        <ul>
                            <li><a href="#">Homepage</a></li>
                            <li><a href="#">About Us</a></li>
                            <li><a href="#">Help</a></li>
                            <li><a href="#">Contact Us</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-3">
                        <h4>Help &amp; Information</h4>
                        <ul>
                            <li><a href="#">Help</a></li>
                            <li><a href="#">FAQ's</a></li>
                            <li><a href="#">Shipping</a></li>
                            <li><a href="#">Tracking ID</a></li>
                        </ul>
                    </div>
                    <div class="col-lg-12">
                        <div class="under-footer">
                            <p>Copyright © 2022 HexaShop Co., Ltd. All Rights Reserved. 

                                <br>Design: <a href="https://templatemo.com" target="_parent" title="free css templates">TemplateMo</a>

                                <br>Distributed By: <a href="https://themewagon.com" target="_blank" title="free & premium responsive templates">ThemeWagon</a></p>
                            <ul>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                <li><a href="#"><i class="fa fa-behance"></i></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </footer>



        <!-- jQuery -->
        <script src="/resources/UserAssets/js/jquery-2.1.0.min.js"></script>

        <!-- Bootstrap -->
        <script src="/resources/UserAssets/js/popper.js"></script>
        <script src="/resources/UserAssets/js/bootstrap.min.js"></script>

        <!-- Plugins -->
        <script src="/resources/UserAssets/js/owl-carousel.js"></script>
        <script src="/resources/UserAssets/js/accordions.js"></script>
        <script src="/resources/UserAssets/js/datepicker.js"></script>
        <script src="/resources/UserAssets/js/scrollreveal.min.js"></script>
        <script src="/resources/UserAssets/js/waypoints.min.js"></script>
        <script src="/resources/UserAssets/js/jquery.counterup.min.js"></script>
        <script src="/resources/UserAssets/js/imgfix.min.js"></script> 
        <script src="/resources/UserAssets/js/slick.js"></script> 
        <script src="/resources/UserAssets/js/lightbox.js"></script> 
        <script src="/resources/UserAssets/js/isotope.js"></script> 
        <script src="/resources/UserAssets/js/quantity.js"></script>

        <!-- Global Init -->
        <script src="/resources/UserAssets/js/custom.js"></script>
   
        <script>
let pr = null;
                                        let unitID = 0;
                                        function showPrice(p, unitID) {
                                            pr = p
                                            $('#productPrice').text(p);
                                            $('#total1').text(p);
                                            $('#unitId').val(unitID);
                                           
                                        }

            let que = $("#quan").val();
            $('#total1').text(pr * que);

            $(".minus").on('click', function (event) {
                que--

                $('#total1').text(pr * que);
            });
            $(".plus").on('click', function (event) {
                que++
                $('#total1').text(pr * que);
            });


            function addToCart(id) {
                let quan = $("#quan").val();
                $.ajax({
                    url: '/UserCartController/AddToCart/' + id + "?quan=" + quan+'&unit='+$('#unitId').val(),
                    method: 'GET',
                    success: function (response) {
                        if (response.success) {
                            Swal.fire({
                                title: 'Thêm vào giỏ hàng thành công!',
                                icon: 'success',
                                showCancelButton: false,
                                confirmButtonText: 'Đồng ý'
                            }).then((result) => {
                                if (result.isConfirmed) {
                                    location.reload();
                                }
                            });
                        }
                    }
                });
            }

        </script>
    </body>
</html>
