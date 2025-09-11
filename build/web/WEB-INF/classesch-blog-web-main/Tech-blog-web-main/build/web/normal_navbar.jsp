<!-- <nav class="navbar navbar-expand-lg navbar-dark primary-background">
     <a class="navbar-brand" href="index.jsp"><span class="fa fa-cubes"></span> Tech~Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="index.jsp"><span class="fa fa-home"></span> Home <span class="sr-only">(current)</span></a>
                    </li>
                    
                    <li class="nav-item active dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-check-square-o"></span> Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming language</a>
                            <a class="dropdown-item" href="#">project implementation</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure</a>
                        </div>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link disabled" href="#"><span class="fa fa-address-card"></span> Contact</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link disabled" href="login_page.jsp"><span class="fa fa-user-circle"></span> Login</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link disabled" href="register_page.jsp"><span class="fa fa-user-plus"></span> SignUp</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-light my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
        </nav>-->

<nav class="navbar navbar-expand-lg navbar-dark sticky-top" 
     style="background: linear-gradient(135deg, #007bff, #6610f2, #6f42c1); background-size: 400% 400%; animation: gradientBG 12s ease infinite;">
    
    <a class="navbar-brand font-weight-bold" href="index.jsp">
        <span class="fa fa-cubes"></span> Tech~Blog
    </a>
    
    <button class="navbar-toggler" type="button" data-toggle="collapse" 
            data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" 
            aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <!-- Left menu -->
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp">
                    <span class="fa fa-home"></span> Home
                </a>
            </li>
            
<!--            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" 
                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <span class="fa fa-check-square-o"></span> Categories
                </a>
                <div class="dropdown-menu">
                    <a class="dropdown-item" href="#">Programming Languages</a>
                    <a class="dropdown-item" href="#">Project Implementations</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structures</a>
                </div>
            </li>-->
            
<!--            <li class="nav-item">
                <a class="nav-link" href="#"><span class="fa fa-address-card"></span> Contact</a>
            </li>-->
        </ul>

        <!-- Right menu -->
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="login_page.jsp">
                    <span class="fa fa-user-circle"></span> Login
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="register_page.jsp">
                    <span class="fa fa-user-plus"></span> Sign Up
                </a>
            </li>
        </ul>

        <!-- Search box -->
        <form class="form-inline ml-3">
            <input class="form-control mr-sm-2" type="search" placeholder="Search..." aria-label="Search">
            <button class="btn btn-outline-light" type="submit">Search</button>
        </form>
    </div>
</nav>

<!-- Navbar gradient animation -->
<style>
@keyframes gradientBG {
    0% { background-position: 0% 50%; }
    50% { background-position: 100% 50%; }
    100% { background-position: 0% 50%; }
}
</style>
