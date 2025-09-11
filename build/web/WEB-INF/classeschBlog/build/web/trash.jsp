<%-- 
    Document   : trash
    Created on : 4 Feb 2025, 9:52:09 am
    Author     : HANUMANA RAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        
        <script>
                            $(document).ready(function () {
                    console.log("loaded......");
                    $('#reg-form').on('submit', function (event) {
                        event.preventDefault();
                        let form = new FormData(this);
                        //send register servlet :
                        $('#submit-btn').hide();
                        $('#loader').show();

                        $.ajax({
                            url: "RegisterServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data);
                                $('#submit-btn').show();
                                $('#loader').hide();
//                                if(data.trim()==='done'){
//                                   swal({
//                                    title: "Success!",
//                                    text: "Successfully Registered! Redirecting to Login..",
//                                    icon: "success",
//                                    button: "ok!"
//                                }).then((value) => {
//                                    window.location = "login_page.jsp"
//                                }); 
//                                }
//                                else{
//                                    swal(data);
//                                }
                                 
                            },
                            error: function (jqXHR, textStatus, errorThrown) {
                                console.log(jqXHR);
                                $('#submit-btn').show();
                                $('#loader').hide();
//                                swal({
//                                    title: "Error!",
//                                    text: "Somthing went wrong....",
//                                    icon: "error",
//                                    button: "ok!"
//                                });
                            },
                            processData: false,
                            contentType: true

                        });

                    });
                });
        </script>
    </body>
</html>
