<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String adopterName = (String) session.getAttribute("fullName");
    String petName = (String) session.getAttribute("petName");
    String email = (String) session.getAttribute("email");
    String date = new java.util.Date().toString();

    if (adopterName == null || petName == null) {
        out.println("Certificate data missing.");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Adoption Certificate</title>

<style>
/* ---------------- SCREEN STYLE ---------------- */
body {
    margin: 0;
    padding: 40px;
    background: #f6f7fb;
    font-family: 'Georgia', serif;
}

.certificate {
    width: 800px;
    height: 700px;
    margin: auto;
    background: #fff;
    border: 12px double #c59d5f;
    padding: 40px;
    position: relative;
    box-shadow: 0 15px 40px rgba(0,0,0,0.2);
    overflow: hidden;
}

/* Decorative pet images */
.pet-img {
    position: absolute;
    opacity: 0.25;
    z-index: 0;
}

.pet1 { top: 25px; left: 25px; width: 170px; }
.pet2 { top: 25px; right: 25px; width: 150px; }
.pet3 { bottom: 20px; left: 30px; width: 170px; }



/* Content */
.name {
        font-size: 32px;
        color: #c59d5f;
        font-weight: bold;
        margin: 15px 0;
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
    margin: 10px 0;
}

.fullnamee {
    font-size: 32px;
    font-weight: bold;
    color: #c59d5f;
    margin: 10px 0;
}

.pet-name {
    font-size: 26px;
    margin: 10px 0;
}

.footer {
    display: flex;
    justify-content: space-between;
    margin-top: 25px;
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

/* ---------------- PRINT FIX ---------------- */
@media print {

    body {
        margin: 0;
        padding: 0;
        background: none;
    }

    @page {
        size: A4 landscape;
        margin: 0;
    }

    .certificate {
        height: 100%;
        margin: 0;
        padding: 40px;
        box-shadow: none;
        border: 10px double #c59d5f;
    }

    .pet-img {
        opacity: 0.3;
    }

    .pet1 { top: 30px; left: 30px; width: 150px; }
    .pet2 { top: 30px; right: 30px; width: 140px; }
    .pet3 { bottom: 25px; left: 30px; width: 140px; }


    .footer {
        margin-top: 5px;
    }
}
</style>
</head>

<body>

<div class="certificate">

    <!-- Background Images -->
    <img class="pet-img pet1" src="https://moonpaws.com/cdn/shop/articles/Different_Easy_Pets_to_Take_Care_of_at_Home_1_0fd072f5-abe7-47b0-8e2d-a24df2a3de03.jpg">
    <img class="pet-img pet2" src="https://i.pinimg.com/originals/41/3c/50/413c50b2f7758da002849544e726385a.jpg">
    <img class="pet-img pet3" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQM3A-B55LLkbGqLTnStSAg-qZhu7CzXiRlHg&s">

    <div class="content">
        <h1>Certificate of Adoption</h1>
        <div class="sub">By</div>

        <div class="name">PawConnect</div>

        <div class="sub">This certificate is proudly presented to</div>
        <div class="fullnamee"><%= adopterName %></div>

        <div class="sub">for lovingly adopting</div>
        <div class="pet-name">🐾 <%= petName %></div>

        <div class="sub">
            and committing to provide care, safety and unconditional love forever
        </div>
        <div class="sub">
            <strong>Adoption ID:</strong> ADP-2025 <br>
            <strong>Issued By:</strong> PawConnect Adoption Center
        </div>

        <div class="footer">
            <div class="signature">
                Adoption Authority
            </div>

            <div class="signature">
                Roshini
                <div class="line"></div>
                Signature
            </div>
        </div>
    </div>
</div>

<script>
/* Auto-open print dialog (optional) */
window.onload = function () {
    window.print();
};
</script>

</body>
</html>