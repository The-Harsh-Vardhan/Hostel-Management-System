<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hostel Management System</title>
    
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-size: cover;
            background-position: center;
            color: #fff;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        h1 {
            font-size: 2.5em;
            color: #000000;
            margin: 20px 0;
            text-align: center;
        }

        header {
            background-color: rgba(44, 62, 80, 0.85); /* Transparent background */
            width: 100%;
            padding: 40px 0;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        header h1 {
            font-size: 2.5em;
            color: #ecf0f1;
            margin: 0;
            text-align: center;
        }

        nav {
            margin-top: 20px;
            text-align: center;
        }

        nav ul {
            list-style-type: none;
            display: flex;
            justify-content: center;
            gap: 30px;
        }

        nav ul li {
            margin: 0 15px;
        }

        nav ul li a {
            color: #ecf0f1;
            text-decoration: none;
            font-weight: bold;
            background-color: #3498db;
            padding: 10px 20px;
            border-radius: 5px;
            transition: all 0.3s ease-in-out;
        }

        nav ul li a:hover {
            background-color: #f39c12;
            transform: scale(1.1);
        }

        p {
            font-size: 1.2em;
            color: #ecf0f1;
            text-align: center;
            max-width: 800px;
            margin: 30px auto;
            background-color: rgba(0, 0, 0, 0.5);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.3);
        }

        footer {
            width: 100%;
            background-color: rgba(44, 62, 80, 0.9);
            color: #ecf0f1;
            text-align: center;
            font-size: 1em;
            border-radius: 10px;
            box-shadow: 0 -5px 20px rgba(0, 0, 0, 0.2);
        }

        footer p {
            font-size: 0.9em;
        }

        /* Image for Hero Section */
        .hero-image {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 20px;
        }

        /* Responsiveness */
        @media (max-width: 768px) {
            h1 {
                font-size: 2em;
            }

            header h1 {
                font-size: 1.8em;
            }

            nav ul {
                flex-direction: column;
                gap: 15px;
            }

            p {
                font-size: 1em;
                padding: 15px;
            }
        }
    </style>
</head>

<body style="background-image: url('images/background.jpeg');" >
    <h1>Welcome to the Hostel Management System</h1>

    <header>
        <h1>Home Page</h1>
        <nav>
            <ul>
                <li><a href="resident.jsp">Resident</a></li>
            </ul>
        </nav>
    </header>

    <p>This system helps you manage residents and rooms efficiently. Use the navigation bar to access different sections
        of the application.</p>

    <footer>
        <p>&copy; 2023 Hostel Management System. All rights reserved.</p>
    </footer>
</body>

</html>
