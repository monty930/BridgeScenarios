using System.ComponentModel.DataAnnotations;

namespace BridgeScenarios.Models.DbModels;

public class User
{
    public DateTime CreationDate = DateTime.UtcNow;

    [Key] public int UserId { get; set; }

    [StringLength(20)] public string Username { get; set; } = string.Empty;

    [StringLength(128)] public string Password { get; set; } = string.Empty;

    [StringLength(50)] public string Email { get; set; } = string.Empty;

    public bool IsAdmin { get; set; }

    public List<UsersSavedContent> SavedContents { get; set; } = [];
}