<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Adoption Certificate</title>

<style>
    body {
        background: #f6f7fb;
        font-family: 'Georgia', serif;
        padding: 40px;
    }

    .certificate {
        width: 900px;
        height: 600px;
        margin: auto;
        background: #fff;
        border: 12px double #c59d5f;
        position: relative;
        padding: 40px;
        box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        overflow: hidden;
    }

    /* Decorative pet images */
    .pet-img {
        position: absolute;
        opacity: 0.3;
        z-index: 0;
    }

    .pet1 { top: 20px; left: 20px; width: 180px; }
    .pet2 { top: 30px; right: 20px; width: 160px; }
    .pet3 { bottom: 30px; left: 30px; width: 170px; }
   .pet4 {
   padding: top:200px;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 550px;
    width: 400px;
}
.a{
display: flex;
    justify-content: center;
    align-items: center;
    height:100;
    mix-blend-mode: lighten;
}
   

    .content {
        position: relative;
        z-index: 2;
        text-align: center;
        padding: 5px;
    }

    h1 {
        font-size: 42px;
        color: #5a3d2b;
        letter-spacing: 2px;
        margin-bottom: 10px;
    }

    .sub {
        font-size: 18px;
        color: #555;
        margin-bottom: 10px;
    }

    .name {
        font-size: 32px;
        color: #c59d5f;
        font-weight: bold;
        margin: 15px 0;
    }

    .pet-name {
        font-size: 26px;
        color: #333;
        margin-bottom: 15px;
    }
    
    .fullname {
        font-size: 30px;
        color: #333;
        margin-bottom: 10px;
    }

    .details {
        font-size: 18px;
        color: #444;
        margin-top: 10px;
    }

    .footer {
        display: flex;
        justify-content: space-between;
        margin-top: 35px;
        font-size: 16px;
    }

    .signature {
        text-align: center;
    }

    .line {
        width: 200px;
        border-top: 2px solid #333;
        margin: 10px auto;
    }
    a{
    text-decoration: none;
    color: black;
    }

</style>
</head>
<body>

<div class="certificate">

    <!-- Background Pet Images -->
    <img class="pet-img pet1" src="https://moonpaws.com/cdn/shop/articles/Different_Easy_Pets_to_Take_Care_of_at_Home_1_0fd072f5-abe7-47b0-8e2d-a24df2a3de03.jpg">
    <img class="pet-img pet2" src="https://i.pinimg.com/originals/41/3c/50/413c50b2f7758da002849544e726385a.jpg">
    <img class="pet-img pet3" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM3A-B55LLkbGqLTnStSAg-qZhu7CzXiRlHg&s">
    <div class="a">
    <img class="pet-img pet4" src="https://i.pinimg.com/564x/ab/b7/05/abb705789de554dfa66d6cdef4071c2d.jpg">
</div>
    <!-- Certificate Content -->
    <div class="content">
        <h1>Certificate of Adoption</h1>
        <div class="sub">By</div>

        <div class="name">PawConnect</div>
        
        <div class="sub">This certificate is proudly presented to</div>

    <div class="fullname"><%= session.getAttribute("fullName") %></div>

        <div class="sub">for lovingly adopting</div>

        <div class="pet-name">🐾<%= session.getAttribute("petName") %></div>

        <div class="sub">and committing to provide care, safety and unconditional love forever</div>
        
        <div class="details"> 
        <ul> 
        <li><a style="color:#c59d5f;font-weight: bold; " href="certificateDownload.jsp">DOWNLOAD CERTIFICATES</a></li> 
        </ul> 
        <span><strong>Adoption ID:</strong> ADP-2025</span> <br><span><strong>Issued By:</strong> PawConnect Adoption Center</span> </div>

        <div class="footer">
            <div class="signature">
                Adoption Authority
            </div>
            <div class="signature">
            Roshini
                <div class="line"></div>
                Signature<br>
                
            </div>
        </div>
    </div>

</div>

</body>
</html>