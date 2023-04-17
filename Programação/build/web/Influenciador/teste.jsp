<%-- 
    Document   : teste
    Created on : 04/12/2022, 02:16:09
    Author     : Vinicius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>


        <input type="file" name="fotoInfluenciador" class="custom-file-input" id="upload" required>

        <br><br>
        <img id="img">


        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>



        <script>
            let photo = document.getElementById('img');
            let file = document.getElementById('upload');


            photo.addEventListener('click', () => {
                file.click();
            });

            file.addEventListener('change', (e) => {
                
                let reader = new FileReader();
                
                reader.onload = () =>{
                    photo.src = reader.result;
                };
                
                
                reader.readAsDataURL(file.files[0]);

            });



        </script>











        <%--
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" 
        integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTw1AQgxVSNgt4=" 
        crossorigin="anonymous"></script>
        
        <script
            src='https://code.jquery.com/jquery-3.2.1.slim.js'
            integrity='sha256-tA8y0XqiwnpwmOIl3SGAcFl2RvxHjA8qp0+1uCGmRmg='
            crossorigin='anonymous'
        ></script>
        <script>
            $(function () {
                $('#upload').change(function () {
                    const file = $(this)[0].files[0]
                    const fileReader = new fileReader()
                    fileReader.onLoadend = function () {
                        $('#img')attr('src', .fileReader.result)
                    }
                    fileReader.readAsDataURL(file)
                })
            })
        </script>
        --%>
    </body>
</html>
