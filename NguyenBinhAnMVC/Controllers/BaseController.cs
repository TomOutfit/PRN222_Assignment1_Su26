using Microsoft.AspNetCore.Mvc;

namespace NguyenBinhAnMVC.Controllers
{
    public class BaseController : Controller
    {
        protected bool IsAuthenticated()
        {
            return HttpContext.Session.GetString("UserEmail") != null;
        }

        protected short? GetCurrentUserId()
        {
            var userId = HttpContext.Session.GetInt32("UserID");
            return userId.HasValue ? (short?)userId.Value : null;
        }

        protected string? GetCurrentUserEmail()
        {
            return HttpContext.Session.GetString("UserEmail");
        }

        protected int? GetCurrentUserRole()
        {
            return HttpContext.Session.GetInt32("UserRole");
        }

        protected bool IsAdmin()
        {
            return GetCurrentUserRole() == 0;
        }

        protected bool IsStaff()
        {
            return GetCurrentUserRole() == 1;
        }

        protected bool IsLecturer()
        {
            return GetCurrentUserRole() == 2;
        }

        protected IActionResult? RequireAuthentication()
        {
            if (!IsAuthenticated())
                return RedirectToAction("Login", "Auth");
            return null;
        }

        protected IActionResult? RequireAdminRole()
        {
            var authResult = RequireAuthentication();
            if (authResult != null) return authResult;
            if (!IsAdmin())
                return RedirectToAction("AccessDenied", "Auth");
            return null;
        }

        protected IActionResult? RequireStaffRole()
        {
            var authResult = RequireAuthentication();
            if (authResult != null) return authResult;
            if (!IsStaff())
                return RedirectToAction("AccessDenied", "Auth");
            return null;
        }

        protected IActionResult? RequireStaffOrAdminRole()
        {
            var authResult = RequireAuthentication();
            if (authResult != null) return authResult;
            if (!IsStaff() && !IsAdmin())
                return RedirectToAction("AccessDenied", "Auth");
            return null;
        }
    }
}
