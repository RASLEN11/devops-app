<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RASLEN11 - Social Links</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0c0c0c, #1a1a1a, #2d2d2d);
            color: #fff;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            padding: 15px;
            overflow-x: hidden;
        }

        .container {
            max-width: 420px;
            width: 100%;
            text-align: center;
            background: rgba(30, 30, 30, 0.85);
            border-radius: 16px;
            padding: 30px 20px;
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.5);
            border: 1px solid rgba(255, 255, 255, 0.1);
            position: relative;
            overflow: hidden;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s ease-out forwards;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Glass effect overlay */
        .container::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(255, 255, 255, 0.05);
            backdrop-filter: blur(8px);
            -webkit-backdrop-filter: blur(8px);
            z-index: -1;
            border-radius: 16px;
        }

        .logo {
            margin-bottom: 25px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .logo-img {
            width: 90px;
            height: 90px;
            border-radius: 50%;
            background: linear-gradient(135deg, #ffffff, #a0a0a0);
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 15px;
            border: 2px solid rgba(255, 255, 255, 0.3);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            animation: pulse 2s infinite alternate;
            transition: transform 0.4s ease;
            overflow: hidden;
        }

        .logo-img:hover {
            transform: rotate(8deg) scale(1.03);
        }

        .logo-img img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 50%;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3);
            }
            100% {
                box-shadow: 0 4px 15px rgba(255, 255, 255, 0.15);
            }
        }

        .logo h1 {
            font-size: 1.8rem;
            margin-bottom: 8px;
            color: #fff;
            font-weight: 700;
            text-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
            background: linear-gradient(45deg, #fff, #a0a0a0);
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            animation: textGlow 3s ease-in-out infinite alternate;
        }

        @keyframes textGlow {
            0% {
                text-shadow: 0 0 4px rgba(255, 255, 255, 0.4);
            }
            100% {
                text-shadow: 0 0 12px rgba(255, 255, 255, 0.6), 0 0 16px rgba(255, 255, 255, 0.4);
            }
        }

        .logo p {
            font-size: 0.95rem;
            color: rgba(255, 255, 255, 0.8);
            max-width: 320px;
            line-height: 1.5;
            position: relative;
            overflow: hidden;
        }

        .logo p::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 1px;
            background: linear-gradient(90deg, transparent, #fff, transparent);
            animation: typing 2.5s steps(35) 0.8s forwards, blink 1s infinite;
        }

        @keyframes typing {
            to {
                width: 100%;
            }
        }

        @keyframes blink {
            0%, 100% {
                opacity: 1;
            }
            50% {
                opacity: 0;
            }
        }

        .social-links {
            display: flex;
            flex-direction: column;
            gap: 12px;
            margin-top: 25px;
        }

        .social-card {
            display: flex;
            align-items: center;
            background: rgba(255, 255, 255, 0.08);
            padding: 14px 18px;
            border-radius: 10px;
            text-decoration: none;
            color: #fff;
            transition: all 0.3s ease;
            border: 1px solid rgba(255, 255, 255, 0.1);
            box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
            opacity: 0;
            transform: translateX(-40px);
            animation: slideInRight 0.5s ease-out forwards;
        }

        .social-card:nth-child(1) { animation-delay: 0.1s; }
        .social-card:nth-child(2) { animation-delay: 0.15s; }
        .social-card:nth-child(3) { animation-delay: 0.2s; }
        .social-card:nth-child(4) { animation-delay: 0.25s; }
        .social-card:nth-child(5) { animation-delay: 0.3s; }
        .social-card:nth-child(6) { animation-delay: 0.35s; }
        .social-card:nth-child(7) { animation-delay: 0.4s; }
        .social-card:nth-child(8) { animation-delay: 0.45s; }
        .social-card:nth-child(9) { animation-delay: 0.5s; }

        @keyframes slideInRight {
            to {
                opacity: 1;
                transform: translateX(0);
            }
        }

        .social-card::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transition: left 0.4s;
        }

        .social-card:hover::before {
            left: 100%;
        }

        .social-card:hover {
            transform: translateY(-4px) scale(1.02);
            background: rgba(255, 255, 255, 0.12);
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            border-color: rgba(255, 255, 255, 0.2);
        }

        .social-card i {
            font-size: 20px;
            width: 30px;
            text-align: center;
            margin-right: 12px;
            transition: all 0.3s ease;
        }

        .social-card span {
            font-size: 0.95rem;
            font-weight: 500;
            transition: transform 0.3s ease;
        }

        .social-card:hover span {
            transform: translateX(4px);
        }

        .social-card.facebook:hover i { 
            color: #1877F2; 
            transform: rotate(12deg) scale(1.15);
        }
        .social-card.instagram:hover i { 
            color: #E4405F; 
            transform: rotate(12deg) scale(1.15);
        }
        .social-card.youtube:hover i { 
            color: #FF0000; 
            transform: rotate(12deg) scale(1.15);
        }
        .social-card.tiktok:hover i { 
            color: #69C9D0; 
            transform: rotate(12deg) scale(1.15);
        }
        .social-card.discord:hover i { 
            color: #5865F2; 
            transform: rotate(12deg) scale(1.15);
        }
        .social-card.twitter:hover i { 
            color: #1DA1F2; 
            transform: rotate(12deg) scale(1.15);
        }
        .social-card.linkedin:hover i { 
            color: #0A66C2; 
            transform: rotate(12deg) scale(1.15);
        }
        .social-card.github:hover i { 
            color: #ffffff; 
            transform: rotate(12deg) scale(1.15);
        }
        .social-card.website:hover i { 
            color: #4CAF50; 
            transform: rotate(12deg) scale(1.15);
        }

        .footer {
            margin-top: 30px;
            font-size: 0.8rem;
            color: rgba(255, 255, 255, 0.7);
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            padding-top: 15px;
            opacity: 0;
            animation: fadeIn 1s ease-out 1s forwards;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        .developer {
            margin-top: 8px;
            font-weight: bold;
            color: rgba(255, 255, 255, 0.9);
            position: relative;
            display: inline-block;
        }

        .developer::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 0;
            height: 1px;
            background: #fff;
            animation: underline 2s ease-in-out infinite alternate;
        }

        @keyframes underline {
            0% {
                width: 0;
                left: 0;
            }
            50% {
                width: 100%;
            }
            100% {
                width: 0;
                left: 100%;
            }
        }

        /* Favicon style for browser tab */
        .favicon {
            display: none;
        }

        /* Tablet Styles */
        @media (min-width: 768px) and (max-width: 1024px) {
            .container {
                max-width: 500px;
                padding: 35px 25px;
            }
            
            .logo-img {
                width: 100px;
                height: 100px;
            }
            
            .logo h1 {
                font-size: 2rem;
            }
            
            .logo p {
                font-size: 1rem;
            }
            
            .social-card {
                padding: 16px 22px;
            }
            
            .social-card i {
                font-size: 22px;
                width: 35px;
            }
            
            .social-card span {
                font-size: 1rem;
            }
        }

        /* Desktop Styles */
        @media (min-width: 1025px) {
            .container {
                max-width: 450px;
                padding: 35px 25px;
            }
            
            .logo-img {
                width: 100px;
                height: 100px;
            }
            
            .logo h1 {
                font-size: 2rem;
            }
            
            .logo p {
                font-size: 1rem;
            }
            
            .social-card {
                padding: 15px 20px;
            }
        }

        /* Small Mobile Styles */
        @media (max-width: 360px) {
            .container {
                padding: 25px 15px;
                border-radius: 14px;
            }
            
            .logo-img {
                width: 80px;
                height: 80px;
            }
            
            .logo h1 {
                font-size: 1.6rem;
            }
            
            .logo p {
                font-size: 0.9rem;
            }
            
            .social-card {
                padding: 12px 15px;
            }
            
            .social-card i {
                font-size: 18px;
                width: 25px;
                margin-right: 10px;
            }
            
            .social-card span {
                font-size: 0.9rem;
            }
        }

        /* Extra Small Mobile Styles */
        @media (max-width: 320px) {
            body {
                padding: 10px;
            }
            
            .container {
                padding: 20px 12px;
            }
            
            .logo h1 {
                font-size: 1.5rem;
            }
            
            .logo p {
                font-size: 0.85rem;
            }
        }
    </style>
    <!-- Favicon link -->
    <link rel="icon" type="image/jpeg" href="assets/logo_r.jpg">
</head>
<body>
    <div class="container">
        <div class="logo">
            <div class="logo-img">
                <img src="assets/raslen.jpg" alt="RASLEN11 Logo">
            </div>
            <h1>RASLEN11</h1>
            <p>Full Stack Web Developer & Desktop App Developer</p>
        </div>
        
        <div class="social-links">
            <a href="https://www.facebook.com/raslen.11/" class="social-card facebook" target="_blank">
                <i class="fab fa-facebook"></i>
                <span>Facebook</span>
            </a>
            
            <a href="https://www.instagram.com/raslen.11/" class="social-card instagram" target="_blank">
                <i class="fab fa-instagram"></i>
                <span>Instagram</span>
            </a>
            
            <a href="https://www.youtube.com/@raslen.11" class="social-card youtube" target="_blank">
                <i class="fab fa-youtube"></i>
                <span>YouTube</span>
            </a>
            
            <a href="https://www.tiktok.com/@raslen.11" class="social-card tiktok" target="_blank">
                <i class="fab fa-tiktok"></i>
                <span>TikTok</span>
            </a>
            
            <a href="https://discord.gg/EDbvb8t7" class="social-card discord" target="_blank">
                <i class="fab fa-discord"></i>
                <span>Discord</span>
            </a>
            
            <a href="https://x.com/raslen_11" class="social-card twitter" target="_blank">
                <i class="fab fa-twitter"></i>
                <span>Twitter</span>
            </a>
            
            <a href="https://www.linkedin.com/in/raslen11/" class="social-card linkedin" target="_blank">
                <i class="fab fa-linkedin"></i>
                <span>LinkedIn</span>
            </a>
            
            <a href="https://github.com/RASLEN11" class="social-card github" target="_blank">
                <i class="fab fa-github"></i>
                <span>GitHub</span>
            </a>
            
            <a href="https://raslen11.netlify.app/" class="social-card website" target="_blank">
                <i class="fas fa-globe"></i>
                <span>Website</span>
            </a>
        </div>
        
        <div class="footer">
            <p>Connect with me on social media!</p>
            <p class="developer">Developed by RASLEN11</p>
        </div>
    </div>

    <script>
        // Add click animations
        document.querySelectorAll('.social-card').forEach(card => {
            card.addEventListener('click', function(e) {
                // Add click animation
                this.style.transform = 'scale(0.95)';
                setTimeout(() => {
                    this.style.transform = 'scale(1)';
                }, 150);
            });
        });

        // Add floating particles in background
        document.addEventListener('DOMContentLoaded', function() {
            const container = document.querySelector('.container');
            for (let i = 0; i < 12; i++) {
                const particle = document.createElement('div');
                particle.style.position = 'absolute';
                particle.style.width = Math.random() * 4 + 1 + 'px';
                particle.style.height = particle.style.width;
                particle.style.background = 'rgba(255, 255, 255, ' + (Math.random() * 0.2 + 0.05) + ')';
                particle.style.borderRadius = '50%';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.top = Math.random() * 100 + '%';
                particle.style.pointerEvents = 'none';
                particle.style.zIndex = '-1';
                particle.style.animation = `float ${Math.random() * 8 + 8}s linear infinite`;
                container.appendChild(particle);
            }
        });

        // Add CSS for floating animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes float {
                0% {
                    transform: translateY(0) translateX(0);
                }
                25% {
                    transform: translateY(-15px) translateX(8px);
                }
                50% {
                    transform: translateY(-30px) translateX(0);
                }
                75% {
                    transform: translateY(-15px) translateX(-8px);
                }
                100% {
                    transform: translateY(0) translateX(0);
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
