using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NguyenBinhAn_A01_Data.Models
{
    [Table("NewsArticle")]
    public class NewsArticle
    {
        [Key]
        [StringLength(20)]
        [Display(Name = "Article ID")]
        public string NewsArticleID { get; set; } = string.Empty;

        [Required(ErrorMessage = "News title is required")]
        [StringLength(400, ErrorMessage = "Title cannot exceed 400 characters")]
        [Display(Name = "News Title")]
        public string? NewsTitle { get; set; }

        [Required(ErrorMessage = "Headline is required")]
        [StringLength(150, ErrorMessage = "Headline cannot exceed 150 characters")]
        public string Headline { get; set; } = string.Empty;

        [Display(Name = "Created Date")]
        public DateTime? CreatedDate { get; set; }

        [StringLength(4000, ErrorMessage = "Content cannot exceed 4000 characters")]
        [Display(Name = "News Content")]
        public string? NewsContent { get; set; }

        [StringLength(400, ErrorMessage = "Source cannot exceed 400 characters")]
        [Display(Name = "News Source")]
        public string? NewsSource { get; set; }

        [Display(Name = "Category")]
        public short? CategoryID { get; set; }

        [Display(Name = "Active")]
        public bool? NewsStatus { get; set; }

        public short? CreatedByID { get; set; }

        public short? UpdatedByID { get; set; }

        [Display(Name = "Modified Date")]
        public DateTime? ModifiedDate { get; set; }
    }
}
