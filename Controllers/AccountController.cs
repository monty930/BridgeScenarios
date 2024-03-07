using System.Security.Claims;
using System.Text;
using BridgeScenarios.Models.DbModels;
using BridgeScenarios.Models.ViewModels;
using BridgeScenarios.Repositories;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;

namespace BridgeScenarios.Controllers;

public class AccountController : Controller
{
    private readonly UserRepository _userRepository = new();
    private readonly PasswordHasher<User> _hasher = new ();

    public async Task<IActionResult> Login()
    {
        return View(new LoginViewModel());
    }
    
    [HttpPost]
    public async Task<ActionResult> Login(LoginViewModel model)
    {
        var user = model.User;
        string? storedPassword = _userRepository.GetPassword(user.Username);
        if (storedPassword is null)
        {
            
            return View(new LoginViewModel
            {
                LoginError = "Invalid username or password."
            });
        }
            
        
        var result = _hasher.VerifyHashedPassword(user, storedPassword, user.Password);
        if (result == PasswordVerificationResult.Failed)
        {
            return View(new LoginViewModel
            {
                LoginError = "Invalid username or password"
            });
        }
        
        var claims = new List<Claim>
        {
            new (ClaimTypes.Name, user.Username),
        };

        var claimsIdentity = new ClaimsIdentity(
            claims, CookieAuthenticationDefaults.AuthenticationScheme);

        var authProperties = new AuthenticationProperties
        {
            AllowRefresh = true,
            ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(10),
            IsPersistent = true,
        };

        await HttpContext.SignInAsync(
            CookieAuthenticationDefaults.AuthenticationScheme,
            new ClaimsPrincipal(claimsIdentity),
            authProperties
        );
        
        return RedirectToAction("Index", "Index", new { area = "" });
    }


    public async Task<ActionResult> Signup(LoginViewModel model)
    {
        var user = model.User;
        if (_userRepository.IsEmailRegistered(user.Email))
        {
            return View("Login", new LoginViewModel
            {
                SignupError = "Email already in use."
            });
        }

        if (_userRepository.IsUsernameRegistered(user.Username))
        {
            return View("Login", new LoginViewModel
            {
                SignupError = "Username already in use."
            });
        }

        user.Password = _hasher.HashPassword(user, user.Password);
        
        if (_userRepository.AddUser(user) == 0)
        {
            return View("Login", new LoginViewModel
            {
                SignupError = "Internal server error, please try again."
            });
        }

        return View("Login", new LoginViewModel
        {
            LoginError = "Registration successful."
        });

    }

    // public ActionResult Logout()
    // {
    //     FormsAuthentication.SignOut();
    //     return RedirectToAction("Index", "Home");
    // }
}