// Create Identity for Source Email
resource "aws_ses_email_identity" "source_email" {
  email = "omojaglorygeorgia@gmail.com"
}

// Create Identity for Destination Email
resource "aws_ses_email_identity" "destination_email" {
  email = "georgiaomoja@gmail.com"
}

//Note
<<<<<<< HEAD
// Verify Email Adrresses by logging in to their individual mailboxes and clicking on the verification message.

=======
// Verify Email Adrresses by logging in to their individual mailboxes and clicking on the verification message.
>>>>>>> 1b7eeef1e4516214a08fc88a0bd32310440d9418
