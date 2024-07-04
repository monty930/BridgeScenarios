﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Multi2Diamonds.Database;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace Multi2Diamonds.Migrations
{
    [DbContext(typeof(MyDbContext))]
    [Migration("20240702191332_pollSetsContainsPollsNotDeals")]
    partial class pollSetsContainsPollsNotDeals
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "8.0.4")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.UseIdentityByDefaultColumns(modelBuilder);

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.Deal", b =>
                {
                    b.Property<int>("DealId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("DealId"));

                    b.Property<DateTime>("CreationDate")
                        .HasColumnType("timestamp with time zone");

                    b.Property<int>("DealSetId")
                        .HasColumnType("integer");

                    b.Property<int>("Dealer")
                        .HasColumnType("integer");

                    b.Property<string>("East")
                        .IsRequired()
                        .HasMaxLength(17)
                        .HasColumnType("character varying(17)");

                    b.Property<string>("North")
                        .IsRequired()
                        .HasMaxLength(17)
                        .HasColumnType("character varying(17)");

                    b.Property<int>("Number")
                        .HasColumnType("integer");

                    b.Property<string>("South")
                        .IsRequired()
                        .HasMaxLength(17)
                        .HasColumnType("character varying(17)");

                    b.Property<int>("Vul")
                        .HasColumnType("integer");

                    b.Property<string>("West")
                        .IsRequired()
                        .HasMaxLength(17)
                        .HasColumnType("character varying(17)");

                    b.HasKey("DealId");

                    b.HasIndex("DealSetId");

                    b.ToTable("Deals");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.DealSet", b =>
                {
                    b.Property<int>("DealSetId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("DealSetId"));

                    b.Property<DateTime>("CreationDate")
                        .HasColumnType("timestamp with time zone");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<int>("UserId")
                        .HasColumnType("integer");

                    b.HasKey("DealSetId");

                    b.HasIndex("UserId");

                    b.ToTable("DealSets");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.Poll", b =>
                {
                    b.Property<int>("PollId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("PollId"));

                    b.Property<string>("Cards")
                        .IsRequired()
                        .HasMaxLength(17)
                        .HasColumnType("character varying(17)");

                    b.Property<DateTime>("CreationDate")
                        .HasColumnType("timestamp with time zone");

                    b.Property<int>("Dealer")
                        .HasColumnType("integer");

                    b.Property<int>("Number")
                        .HasColumnType("integer");

                    b.Property<int>("PollSetId")
                        .HasColumnType("integer");

                    b.Property<int>("Vul")
                        .HasColumnType("integer");

                    b.HasKey("PollId");

                    b.HasIndex("PollSetId");

                    b.ToTable("Polls");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.PollSet", b =>
                {
                    b.Property<int>("PollSetId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("PollSetId"));

                    b.Property<DateTime>("CreationDate")
                        .HasColumnType("timestamp with time zone");

                    b.Property<string>("KeyBinds")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<string>("OutputRaw")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int>("UserId")
                        .HasColumnType("integer");

                    b.HasKey("PollSetId");

                    b.HasIndex("UserId");

                    b.ToTable("PollSets");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.Scenario", b =>
                {
                    b.Property<int>("ScenarioId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("ScenarioId"));

                    b.Property<DateTime>("CreationDate")
                        .HasColumnType("timestamp with time zone");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasMaxLength(40)
                        .HasColumnType("character varying(40)");

                    b.Property<string>("ScenarioContent")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<int>("UserId")
                        .HasColumnType("integer");

                    b.HasKey("ScenarioId");

                    b.HasIndex("UserId");

                    b.ToTable("Scenarios");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.User", b =>
                {
                    b.Property<int>("UserId")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("integer");

                    NpgsqlPropertyBuilderExtensions.UseIdentityByDefaultColumn(b.Property<int>("UserId"));

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasMaxLength(50)
                        .HasColumnType("character varying(50)");

                    b.Property<bool>("IsAdmin")
                        .HasColumnType("boolean");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasMaxLength(128)
                        .HasColumnType("character varying(128)");

                    b.Property<string>("ProfilePicturePath")
                        .HasColumnType("text");

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("character varying(20)");

                    b.HasKey("UserId");

                    b.ToTable("Users");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.Deal", b =>
                {
                    b.HasOne("Multi2Diamonds.Models.DbModels.DealSet", null)
                        .WithMany("Deals")
                        .HasForeignKey("DealSetId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.DealSet", b =>
                {
                    b.HasOne("Multi2Diamonds.Models.DbModels.User", "User")
                        .WithMany("DealSets")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.Poll", b =>
                {
                    b.HasOne("Multi2Diamonds.Models.DbModels.PollSet", null)
                        .WithMany("Polls")
                        .HasForeignKey("PollSetId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.PollSet", b =>
                {
                    b.HasOne("Multi2Diamonds.Models.DbModels.User", "User")
                        .WithMany("PollSets")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.OwnsOne("Multi2Diamonds.Models.Bridge.Bidding", "Bidding", b1 =>
                        {
                            b1.Property<int>("PollSetId")
                                .HasColumnType("integer");

                            b1.Property<int[]>("Bids")
                                .IsRequired()
                                .HasColumnType("integer[]");

                            b1.Property<int>("Dealer")
                                .HasColumnType("integer");

                            b1.HasKey("PollSetId");

                            b1.ToTable("PollSets");

                            b1.WithOwner()
                                .HasForeignKey("PollSetId");
                        });

                    b.Navigation("Bidding")
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.Scenario", b =>
                {
                    b.HasOne("Multi2Diamonds.Models.DbModels.User", "User")
                        .WithMany("Scenarios")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("User");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.DealSet", b =>
                {
                    b.Navigation("Deals");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.PollSet", b =>
                {
                    b.Navigation("Polls");
                });

            modelBuilder.Entity("Multi2Diamonds.Models.DbModels.User", b =>
                {
                    b.Navigation("DealSets");

                    b.Navigation("PollSets");

                    b.Navigation("Scenarios");
                });
#pragma warning restore 612, 618
        }
    }
}
