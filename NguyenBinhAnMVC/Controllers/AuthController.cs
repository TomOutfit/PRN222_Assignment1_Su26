using Microsoft.AspNetCore.Mvc;
using NguyenBinhAn_A01_Business.Services;
using NguyenBinhAn_A01_Data.Models;
using NguyenBinhAnMVC.Models;

namespace NguyenBinhAnMVC.Controllers
{
    public class AuthController : Controller
    {
        private readonly IAuthService _authService;

        public AuthController(IAuthService authService)
        {
            _authService = authService;
        }

        [HttpGet]
        public IActionResult Login()
        {
            // Check if user is already logged in
            if (HttpContext.Session.GetString("UserEmail") != null)
            {
                return RedirectToAction("Index", "Home");
            }

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Login(LoginViewModel model)
        {
            if (ModelState.IsValid)
            {
                var user = await _authService.AuthenticateAsync(model.Email, model.Password);
                
                if (user != null)
                {
                    // Store user information in session
                    HttpContext.Session.SetString("UserEmail", user.AccountEmail ?? "");
                    HttpContext.Session.SetString("UserName", user.AccountName ?? "");
                    HttpContext.Session.SetInt32("UserID", user.AccountID);
                    HttpContext.Session.SetInt32("UserRole", user.AccountRole ?? 2);

                    // Redirect based on role
                    return (user.AccountRole ?? 2) switch
                    {
                        0 => RedirectToAction("Dashboard", "Admin"), // Admin
                        1 => RedirectToAction("Dashboard", "Staff"), // Staff
                        2 => RedirectToAction("Index", "Home"),      // Lecturer
                        _ => RedirectToAction("Index", "Home")
                    };
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt.");
                }
            }

            return View(model);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Logout()
        {
            // Clear session
            HttpContext.Session.Clear();
            
            return RedirectToAction("Login", "Auth");
        }

        public IActionResult AccessDenied()
        {
            return View();
        }
    }
}
