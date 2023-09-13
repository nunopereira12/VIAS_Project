<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
<%@include file="header.jsp"%>
<head>
    <title>VIAS - Contactos</title>
    <link rel="stylesheet" href="/css/template.css">
    <link rel="stylesheet" href="/css/contactos.css">
</head>
<body>

<div class="container">
    <button class="arrowbutton" onclick="window.location.href='/home';">
        <img src="/images/backarrow.png" alt="Go back!" width="30px">
    </button>
    <p class="title">Contactos</p>
    <div class="content">
        <div class="switches-container" style="margin-top: 50px">
            <input type="radio" id="switchLeague" name="switchPlan" value="My League Logo" checked="checked"/>
            <input type="radio" id="switchLeaderboard" name="switchPlan" value="Leaderboard"/>
            <label for="switchLeague">
                <div class="centered-content">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 31 30" fill="none">
                        <mask id="mask0_530_775" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="31" height="30">
                            <rect x="0.5" width="30" height="30" fill="#D9D9D9"/>
                        </mask>
                        <g mask="url(#mask0_530_775)">
                            <path d="M5.5 25C4.8125 25 4.22396 24.7552 3.73438 24.2656C3.24479 23.776 3 23.1875 3 22.5V7.5C3 6.8125 3.24479 6.22396 3.73438 5.73438C4.22396 5.24479 4.8125 5 5.5 5H25.5C26.1875 5 26.776 5.24479 27.2656 5.73438C27.7552 6.22396 28 6.8125 28 7.5V22.5C28 23.1875 27.7552 23.776 27.2656 24.2656C26.776 24.7552 26.1875 25 25.5 25H5.5ZM15.5 16.25L5.5 10V22.5H25.5V10L15.5 16.25ZM15.5 13.75L25.5 7.5H5.5L15.5 13.75ZM5.5 10V7.5V22.5V10Z" fill="white"/>
                        </g>
                    </svg>
                    <span style="margin-left: 5px">E-mail</span>
                </div>
            </label>
            <label for="switchLeaderboard">
                <div class="centered-content">
                    <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 21 20" fill="none">
                        <path d="M20.4836 9.41027C20.1436 3.61107 14.8743 -0.858339 8.80508 0.14153C4.62561 0.83144 1.27605 4.22098 0.626136 8.4004C0.246185 10.8201 0.74614 13.1098 1.836 14.9995L0.946104 18.3091C0.74613 19.059 1.43602 19.7389 2.17592 19.5289L5.43551 18.6291C6.91531 19.499 8.6451 19.9989 10.4949 19.9989C16.1341 19.9989 20.8135 15.0295 20.4836 9.41027ZM15.3842 13.7197C15.2942 13.8997 15.1842 14.0697 15.0443 14.2296C14.7943 14.4996 14.5243 14.6996 14.2244 14.8196C13.9244 14.9495 13.5945 15.0095 13.2445 15.0095C12.7346 15.0095 12.1846 14.8897 11.6147 14.6397C11.0348 14.3897 10.4649 14.0597 9.89493 13.6497C9.31501 13.2298 8.77508 12.7598 8.25515 12.2499C7.73522 11.73 7.27525 11.18 6.8553 10.6101C6.44536 10.0402 6.11542 9.47026 5.87545 8.90034C5.63548 8.33041 5.51552 7.78053 5.51552 7.2606C5.51552 6.92063 5.5755 6.59068 5.69548 6.29072C5.81547 5.98076 6.00546 5.7008 6.27543 5.45084C6.59539 5.13088 6.94532 4.9809 7.31527 4.9809C7.45524 4.9809 7.59521 5.01088 7.72519 5.07088C7.85517 5.13087 7.97518 5.22086 8.06517 5.35084L9.22502 6.99062C9.31501 7.1206 9.385 7.23058 9.425 7.34057C9.47499 7.45056 9.49499 7.55054 9.49499 7.65053C9.49499 7.77051 9.45499 7.89052 9.385 8.01045C9.31501 8.13044 9.22502 8.25042 9.10504 8.37041L8.72509 8.77035C8.6651 8.83034 8.6451 8.89034 8.6451 8.97033C8.6451 9.01032 8.6551 9.05032 8.6651 9.09031C8.68509 9.13031 8.69509 9.1603 8.70509 9.1903C8.79508 9.36028 8.95506 9.57025 9.17503 9.83021C9.405 10.0902 9.64497 10.3601 9.90493 10.6201C10.1749 10.8901 10.4349 11.13 10.7048 11.36C10.9648 11.58 11.1848 11.73 11.3547 11.82C11.3847 11.83 11.4147 11.85 11.4447 11.8599C11.4847 11.8799 11.5247 11.8799 11.5747 11.8799C11.6647 11.8799 11.7247 11.8499 11.7847 11.79L12.1646 11.41C12.2946 11.28 12.4146 11.19 12.5246 11.13C12.6446 11.0601 12.7546 11.0201 12.8845 11.0201C12.9845 11.0201 13.0845 11.0401 13.1945 11.09C13.3045 11.14 13.4245 11.2 13.5445 11.29L15.2042 12.4699C15.3342 12.5599 15.4242 12.6698 15.4842 12.7898C15.5342 12.9198 15.5642 13.0398 15.5642 13.1798C15.5042 13.3498 15.4642 13.5397 15.3842 13.7197Z" fill="white"/>
                    </svg>
                    <span>Whatsapp</span>
                </div>
            </label>
            <div class="switch-wrapper">
                <div class="switch">
                    <div class="centered-content">
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 31 30" fill="none">
                            <mask id="mask0_530_775" style="mask-type:alpha" maskUnits="userSpaceOnUse" x="0" y="0" width="31" height="30">
                                <rect x="0.5" width="30" height="30" fill="#D9D9D9"/>
                            </mask>
                            <g mask="url(#mask0_530_775)">
                                <path d="M5.5 25C4.8125 25 4.22396 24.7552 3.73438 24.2656C3.24479 23.776 3 23.1875 3 22.5V7.5C3 6.8125 3.24479 6.22396 3.73438 5.73438C4.22396 5.24479 4.8125 5 5.5 5H25.5C26.1875 5 26.776 5.24479 27.2656 5.73438C27.7552 6.22396 28 6.8125 28 7.5V22.5C28 23.1875 27.7552 23.776 27.2656 24.2656C26.776 24.7552 26.1875 25 25.5 25H5.5ZM15.5 16.25L5.5 10V22.5H25.5V10L15.5 16.25ZM15.5 13.75L25.5 7.5H5.5L15.5 13.75ZM5.5 10V7.5V22.5V10Z" fill="white"/>
                            </g>
                        </svg>
                        <span style="margin-left: 5px"> E-mail </span>
                    </div>
                    <div class="centered-content">
                        <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" viewBox="0 0 21 20" fill="none">
                            <path d="M20.4836 9.41027C20.1436 3.61107 14.8743 -0.858339 8.80508 0.14153C4.62561 0.83144 1.27605 4.22098 0.626136 8.4004C0.246185 10.8201 0.74614 13.1098 1.836 14.9995L0.946104 18.3091C0.74613 19.059 1.43602 19.7389 2.17592 19.5289L5.43551 18.6291C6.91531 19.499 8.6451 19.9989 10.4949 19.9989C16.1341 19.9989 20.8135 15.0295 20.4836 9.41027ZM15.3842 13.7197C15.2942 13.8997 15.1842 14.0697 15.0443 14.2296C14.7943 14.4996 14.5243 14.6996 14.2244 14.8196C13.9244 14.9495 13.5945 15.0095 13.2445 15.0095C12.7346 15.0095 12.1846 14.8897 11.6147 14.6397C11.0348 14.3897 10.4649 14.0597 9.89493 13.6497C9.31501 13.2298 8.77508 12.7598 8.25515 12.2499C7.73522 11.73 7.27525 11.18 6.8553 10.6101C6.44536 10.0402 6.11542 9.47026 5.87545 8.90034C5.63548 8.33041 5.51552 7.78053 5.51552 7.2606C5.51552 6.92063 5.5755 6.59068 5.69548 6.29072C5.81547 5.98076 6.00546 5.7008 6.27543 5.45084C6.59539 5.13088 6.94532 4.9809 7.31527 4.9809C7.45524 4.9809 7.59521 5.01088 7.72519 5.07088C7.85517 5.13087 7.97518 5.22086 8.06517 5.35084L9.22502 6.99062C9.31501 7.1206 9.385 7.23058 9.425 7.34057C9.47499 7.45056 9.49499 7.55054 9.49499 7.65053C9.49499 7.77051 9.45499 7.89052 9.385 8.01045C9.31501 8.13044 9.22502 8.25042 9.10504 8.37041L8.72509 8.77035C8.6651 8.83034 8.6451 8.89034 8.6451 8.97033C8.6451 9.01032 8.6551 9.05032 8.6651 9.09031C8.68509 9.13031 8.69509 9.1603 8.70509 9.1903C8.79508 9.36028 8.95506 9.57025 9.17503 9.83021C9.405 10.0902 9.64497 10.3601 9.90493 10.6201C10.1749 10.8901 10.4349 11.13 10.7048 11.36C10.9648 11.58 11.1848 11.73 11.3547 11.82C11.3847 11.83 11.4147 11.85 11.4447 11.8599C11.4847 11.8799 11.5247 11.8799 11.5747 11.8799C11.6647 11.8799 11.7247 11.8499 11.7847 11.79L12.1646 11.41C12.2946 11.28 12.4146 11.19 12.5246 11.13C12.6446 11.0601 12.7546 11.0201 12.8845 11.0201C12.9845 11.0201 13.0845 11.0401 13.1945 11.09C13.3045 11.14 13.4245 11.2 13.5445 11.29L15.2042 12.4699C15.3342 12.5599 15.4242 12.6698 15.4842 12.7898C15.5342 12.9198 15.5642 13.0398 15.5642 13.1798C15.5042 13.3498 15.4642 13.5397 15.3842 13.7197Z" fill="white"/>
                        </svg>
                        <span> Whatsapp </span>
                    </div>
                </div>
            </div>
        </div>
        <div class="contact-box">
                <form action="/send_message" method="POST">
                    <div class="mb-3">
                        <label class="form-label text-start" for="name">Nome</label>
                        <input class="form-box-contact formtext-contact" type="text" id="name" name="name" placeholder="Insira o seu nome" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-start" for="email">E-mail</label>
                        <input class="form-box-contact formtext-contact" type="text" id="email" name="email" placeholder="Insira o seu e-mail" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label text-start" for="text_id">Mensagem</label>
                        <textarea class="form-box-contact formtext-contact form-box-message" id="text_id" name="text" max_length="500" placeholder="Insira a sua mensagem" required></textarea>
                    </div>
                    <div class="d-grid">
                        <button type="submit" id="buttonentry" class="btn btn-primary buttons">
                            Enviar
                        </button>
                    </div>
                </form>

        </div>

    </div>

</div>


<div class="footerlogo">
    <footer>
        <img class="footerimage" src="images/logo_nobg.png" alt="">
    </footer>
</div>
</body>
</html>