using BridgeScenarios.Database;
using BridgeScenarios.Models.DbModels;

namespace BridgeScenarios.Repositories;

public class UserRepository
{
    private readonly MyDbContext _context = new();
    
    public int AddUser(User user)
    {
        _context.Users.Add(user);
        _context.SaveChanges();
        return user.UserId;
    }
    
    public void RemoveUser(User user)
    {
        _context.Users.Remove(user);
        _context.SaveChanges();
    }

    public User? GetByName(string name)
    {
        return _context.Users.FirstOrDefault(u => u.Username == name);
    }

    
    public string? GetPassword(string username)
    {
        return _context.Users.Where(u => u.Username == username).Select(u => u.Password).FirstOrDefault();
    }

    public bool IsEmailRegistered(string email)
    {
        return _context.Users.Any(u => u.Email == email);
    }

    public bool IsUsernameRegistered(string username)
    {
        return _context.Users.Any(u => u.Username == username);
    }
    
    public void AddSavedContent(UsersSavedContent savedContent)
    {
        _context.SavedContents.Add(savedContent);
        _context.SaveChanges();
    }
    
    public void UpdateSavedContent(UsersSavedContent savedContent)
    {
        Console.WriteLine("---AddSavedContent");
        Console.WriteLine(savedContent.SavedContentId);
        Console.WriteLine(savedContent.SavedContentType);
        Console.WriteLine(savedContent.Name);
        Console.WriteLine(savedContent.Content);
        Console.WriteLine(savedContent.Exists);
        Console.WriteLine(savedContent.UserId);
        Console.WriteLine(savedContent.User.Username);
        
        var existingEntity = _context.SavedContents.Find(savedContent.SavedContentId);
        if(existingEntity != null)
        {
            Console.WriteLine("Updating existing entity");
            _context.Entry(existingEntity).CurrentValues.SetValues(savedContent);
        }
        else
        {
            Console.WriteLine("Adding new entity");
            _context.SavedContents.Update(savedContent);
        }
        _context.SaveChanges();
    }
    
    public void RemoveSavedContent(UsersSavedContent savedContent)
    {
        _context.SavedContents.Remove(savedContent);
        _context.SaveChanges();
    }
    
    public List<UsersSavedContent> GetSavedContents(User user)
    {
        return _context.SavedContents.Where(d => d.User.UserId == user.UserId).ToList();
    }
    
    public UsersSavedContent? GetSavedContentById(int id)
    {
        return _context.SavedContents.FirstOrDefault(d => d.SavedContentId == id);
    } 
}