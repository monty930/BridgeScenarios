﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Multi2Diamonds.Migrations
{
    /// <inheritdoc />
    public partial class AddProfilePicturePathToUser : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "ProfilePicturePath",
                table: "Users",
                type: "text",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "ProfilePicturePath",
                table: "Users");
        }
    }
}
