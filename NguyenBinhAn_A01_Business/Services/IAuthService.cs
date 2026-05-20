using NguyenBinhAn_A01_Data.Models;

namespace NguyenBinhAn_A01_Business.Services
{
    public interface IAuthService
    {
        Task<SystemAccount?> AuthenticateAsync(string email, string password);
        Task<SystemAccount> GetAdminAccountAsync();
    }
}
