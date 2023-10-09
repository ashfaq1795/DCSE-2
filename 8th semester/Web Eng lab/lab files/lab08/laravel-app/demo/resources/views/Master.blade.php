<!DOCTYPE html>
<html>
<head>
    <title>My Laravel App</title>
    <style>
        /* CSS styles for the layout */
        body {
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        header {
            background-color: #333;
            color: #fff;
            padding: 20px;
        }

        aside {
            background-color: #f2f2f2;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        main {
            background-color: #fff;
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 20px;
            text-align: center;
        }

        main > div {
            margin: 20px;
        }

        .sidebar-container {
            display: flex;
        }

        .left-sidebar {
            width: 20%;
            height: 375px;
        }

        .right-sidebar {
            width: 20%;
            height: 375px
        }

        .content-container {
            width: 60%;
        }

        @media screen and (max-width: 768px) {
            .sidebar-container {
                flex-direction: column;
            }

            .left-sidebar,
            .right-sidebar {
                width: 100%;
            }

            .content-container {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <h1>Welcome to My Laravel App</h1>
    </header>

    <!-- Sidebar Container -->
    <div class="sidebar-container">
        <!-- Left Sidebar -->
        <aside class="left-sidebar">
            <h3>Left Sidebar</h3>
            <p>This is the left sidebar content.</p>
        </aside>

        <!-- Main Content -->
        <main class="content-container">
            <div>
                @yield('content')
            </div>
        </main>

        <!-- Right Sidebar -->
        <aside class="right-sidebar">
            <h3>Right Sidebar</h3>
            <p>This is the right sidebar content.</p>
        </aside>
    </div>

    <!-- Footer -->
    <footer>
        <p>© <?php echo date('Y'); ?> My Laravel App. All rights reserved.</p>
    </footer>
</body>
</html>
