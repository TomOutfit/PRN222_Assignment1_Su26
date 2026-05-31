using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace NguyenBinhAn_A01_Data.Models
{
    [Table("NewsTag")]
    public class NewsTag
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string NewsArticleID { get; set; } = string.Empty;

        [Key]
        [Column(Order = 1)]
        public int TagID { get; set; }
    }
}
