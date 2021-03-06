namespace ContactBook.ModelDto
{
    public class UpdateContactDto
    {
        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Email { get; set; }
        public string PhotoUrl { get; set; }

        public string PhoneNumber { get; set; }
        public string HouseNumber { get; set; }

        public string Street { get; set; }
        public string City { get; set; }
        public string State { get; set; }

        public string Country { get; set; }
    }
}
