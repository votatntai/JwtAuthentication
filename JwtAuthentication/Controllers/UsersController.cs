﻿using JwtAuthentication.Data;
using JwtAuthentication.DataEntity;
using JwtAuthentication.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;

namespace JwtAuthentication.Controllers
{
    [ApiController]
    public class UsersController : ControllerBase
    {
        private IUserService _userService;

        public UsersController(IUserService userService)
        {
            _userService = userService;
        }

        [HttpPost]
        [Route("Users/Authenticate")]
        public IActionResult Authenticate(AuthenticateRequest model)
        {
            var response = _userService.Authenticate(model);

            if (response == null)
                return BadRequest(new { message = "Username or password is incorrect" });

            return Ok(response);
        }

        [HttpPost]
        [Route("Users/Register")]
        public ActionResult<AuthenticateResponse> Register(UserRegisterModel model)
        {
            var userId = Guid.NewGuid();
            var user = new User
            {
                Id = userId,
                Name = model.Name,
                Username = model.Username,
                Email = model.Email,
                Password = model.Password,
                Status = "Not Activated"
            };

            var result = _userService.UserExist(user);

            if (result != "Valid")
            {
                return StatusCode(400, result);
            }

            var ur = new UserRole();
            ur.UserId = userId;
            ur.RoleId = Guid.Parse("9c076c5c-d4d9-4426-b6bf-da7b01c49d81");
            user.UserRoles.Add(ur);

            _userService.Register(user);

            var authenticate = new AuthenticateRequest
            {
                Username = user.Username,
                Password = user.Password
            };

            return _userService.Authenticate(authenticate);
        }

        [Authorize("Admin")]
        [HttpPost]
        [Route("Admin/Users/Register")]
        public ActionResult<UserResponse> RegisterWithRoles(UserRegisterWithRole model)
        {
            var userId = Guid.NewGuid();
            var user = new User
            {
                Id = userId,
                Name = model.Name,
                Username = model.Username,
                Email = model.Email,
                Password = model.Password,
                Status = "Not Activated"
            };

            var result = _userService.UserExist(user);

            if (result != "Valid")
            {
                return StatusCode(400, result);
            }

            _userService.Register(user);

            return _userService.AddRoles(userId, model);

        }

        [Authorize("Admin")]
        [HttpPut]
        [Route("Users/Activate/{id}")]
        public IActionResult ActivateUser([FromRoute] Guid id)
        {
            var result = _userService.ActivateUser(id);
            if (result.Equals("User has been activated"))
            {
                return StatusCode(400, result);
            }
            if (result.Equals("User does not exist"))
            {
                return StatusCode(404, result);
            }
            return StatusCode(201, result);
        }


        [Authorize("Admin")]
        [HttpGet]
        [Route("Users/View/{id}")]
        public ActionResult<UserResponse> GetUser(Guid id)
        {
            var u = _userService.GetById(id);
            return new UserResponse
            {
                Id = u.Id,
                Roles = u.UserRoles.Select(x => x.Role.RoleName).ToArray(),
                Email = u.Email,
                Name = u.Name,
                Username = u.Username,
                Status = u.Status
            };
        }

        [Authorize("Admin")]
        [HttpGet]
        [Route("Users")]
        public IActionResult GetAll([FromQuery] Pagination param)
        {
            var users = _userService.GetAll(param);
            return Ok(new ResponsePagination<UserResponse>(users)
            {
                Total = _userService.TotalUser(),
                Type = "Users"
            });
        }
    }
}