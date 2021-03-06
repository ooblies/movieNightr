﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace MovieNightr.Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class MovieNightrEntities : DbContext
    {
        public MovieNightrEntities()
            : base("name=MovieNightrEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Actors> Actors { get; set; }
        public virtual DbSet<Directors> Directors { get; set; }
        public virtual DbSet<EventMovies> EventMovies { get; set; }
        public virtual DbSet<Events> Events { get; set; }
        public virtual DbSet<EventUsers> EventUsers { get; set; }
        public virtual DbSet<EventUserStatus> EventUserStatus { get; set; }
        public virtual DbSet<Filters> Filters { get; set; }
        public virtual DbSet<FilterSetFilters> FilterSetFilters { get; set; }
        public virtual DbSet<FilterSets> FilterSets { get; set; }
        public virtual DbSet<Friendship> Friendship { get; set; }
        public virtual DbSet<FriendshipStatus> FriendshipStatus { get; set; }
        public virtual DbSet<Genres> Genres { get; set; }
        public virtual DbSet<Languages> Languages { get; set; }
        public virtual DbSet<MovieActors> MovieActors { get; set; }
        public virtual DbSet<MovieDirectors> MovieDirectors { get; set; }
        public virtual DbSet<MovieGenres> MovieGenres { get; set; }
        public virtual DbSet<MovieLanguages> MovieLanguages { get; set; }
        public virtual DbSet<MovieLists> MovieLists { get; set; }
        public virtual DbSet<MovieListStatus> MovieListStatus { get; set; }
        public virtual DbSet<MovieProducers> MovieProducers { get; set; }
        public virtual DbSet<Movies> Movies { get; set; }
        public virtual DbSet<MovieTags> MovieTags { get; set; }
        public virtual DbSet<MovieWriters> MovieWriters { get; set; }
        public virtual DbSet<Producers> Producers { get; set; }
        public virtual DbSet<Recommendations> Recommendations { get; set; }
        public virtual DbSet<Tags> Tags { get; set; }
        public virtual DbSet<Users> Users { get; set; }
        public virtual DbSet<UserStatus> UserStatus { get; set; }
        public virtual DbSet<Writers> Writers { get; set; }
    }
}
