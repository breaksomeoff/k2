<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="main.java.model.UserBean"%>
<% if (session.getAttribute("registeredUser") == null) {
		response.sendRedirect("loginPage.jsp");
	}
%>
<jsp:useBean id="registeredUser" class="main.java.model.UserBean" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
 	<title>Geek Factory - Aggiungi Recensione</title>
    <link rel="stylesheet" href="./css/account.css">
    <link rel="icon" href="./img/icon.png">
    <script>
        function validateInput() {
            const pattern = /[<>"/']/;
            const fields = ['testo'];
            for (let i = 0; i < fields.length; i++) {
                const field = document.getElementById(fields[i]).value;
                if (pattern.test(field)) {
                    alert('I campi non possono contenere caratteri speciali come <, >, ", \'');
                    return false;
                }
            }
            return true;
        }
    </script>
</head>
<body>
	<div class="header">
		<jsp:include page="header.jsp"/>
	</div>
	
	<div class="test">
	<div class="container" style="height: 540px">
		<div class="title">Inserisci recensione per il prodotto</div>
		<div class="content">
		<%	
			String emailRec = null;
			String action = "OrderControl?action=aggiungi&codice=" + request.getParameter("codice");
			if (request.getParameter("emailRec") != null) {
				emailRec = request.getParameter("emailRec");
				action = "RecensioneControl?action=aggiungiMod&emailRec=" + emailRec + "&codice=" + request.getParameter("codice");
			}
		%>
		<form action="<%=action%>" METHOD="POST" onsubmit="return validateInput();">
			<div class="user-details" style="display: block">
				<div class="input-box">
					<span class="details">Votazione (da 1 a 10)</span>
					<input type="number" step="1" name="votazione" min="1" max="10" value="<%=request.getParameter("voto") != null ? Integer.parseInt(request.getParameter("voto")) : "" %>" placeholder="1-10" required style="margin-bottom: 30px; width: 18%"/>
				</div>
				<div class="input-box">
					<span class="details">Testo (opzionale)</span>
					<textarea id="testo" name="testo" rows="4" cols="60" placeholder="Aggiungi testo della recensione (opzionale)..." style="resize: none; width: 600px; height: 160px; margin-bottom: 30px"><%=request.getParameter("testo") != null ? request.getParameter("testo") : "" %></textarea>
				</div>
			</div>
			<div class="button">
				<input type="submit" class="recensione" name="recensione" id="recensione" value="Aggiungi recensione" style="margin-top: 80px; margin-bottom: 40px">
			</div>
		</form>
		
	</div>
	</div>
	</div>
	
	<div class="footer">
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>
