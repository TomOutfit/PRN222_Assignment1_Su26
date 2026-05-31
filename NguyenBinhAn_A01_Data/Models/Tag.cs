using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NguyenBinhAn_A01_Data.Models
{
    [Table("Tag")]
    public class Tag
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)] // No IDENTITY in DB - TagID must be set manually
        public int TagID { get; set; }

        [Required(ErrorMessage = "Tag name is required")]
        [StringLength(50, ErrorMessage = "Tag name cannot exceed 50 characters")]
        public string? TagName { get; set; }

        [StringLength(400, ErrorMessage = "Note cannot exceed 400 characters")]
        public string? Note { get; set; }
    }
}
