using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NguyenBinhAn_A01_Data.Models
{
    [Table("SystemAccount")]
    public class SystemAccount
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)] // No IDENTITY in DB
        public short AccountID { get; set; }

        [Required(ErrorMessage = "Account name is required")]
        [StringLength(100, ErrorMessage = "Account name cannot exceed 100 characters")]
        public string? AccountName { get; set; }

        [Required(ErrorMessage = "Email is required")]
        [StringLength(70, ErrorMessage = "Email cannot exceed 70 characters")]
        [EmailAddress(ErrorMessage = "Invalid email format")]
        public string? AccountEmail { get; set; }

        public int? AccountRole { get; set; } // 0: Admin, 1: Staff, 2: Lecturer

        [StringLength(70, ErrorMessage = "Password cannot exceed 70 characters")]
        public string? AccountPassword { get; set; }
    }
}
