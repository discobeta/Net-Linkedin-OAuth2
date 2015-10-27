# Linkedin-OAuth2
An easy way to authenticate users via LinkedIn using Perl5

NAME
       Linkedin::OAuth2 - An easy way to authenticate users via LinkedIn.

VERSION
       version 0.2

SYNOPSIS
       my $linkedin = Linkedin::OAuth2->new( key => 'your-app-key',
       secret   => 'your-app-secret');

       # here is an entire login logic or recipe:

my $linkedin = Linkedin::OAuth2->new( key => 'your-app-key',secret => 'your-app-secret');

      # catch the code param and try to convert it into an access_token and get the email address
```
if (param('code')) {
  my $token_object = $linkedin->get_access_token(
    authorization_code => param('code'),
    redirect_uri =>       'your-app-redirect-uri-or-callback-url'
  );
  my $result = $linkedin->request( url    => 'https://api.linkedin.com/v1/people/~:(id,formatted-name,picture-url,email-address)?format=json', token  => $token_object->{access_token} );

  if ($result->{emailAddress}) {
  
    # we have the email address, authenticate the user and redirect somewhere..
    # ....

    return;
  } else {
    # we did not get an email address
    # redirect to try again?
    return;
  }
}

	# get the url for permissions
	
	my $authorization_code_url = $linkedin->authorization_code_url(
		# this field is required
	    redirect_uri => 'your-app-redirect', 
	    #array of permissions that your app requires, see http://developer.linkedin.com/documents/authentication#granting for more details, this field is optional
	    scope    => ['r_basicprofile','rw_groups','r_emailaddress'] 
	);
	
	#redirect the user to get their permission
	redirect($authorization_code_url);

	# and catch an error back from linked in
	if (param('error')) {
	    # handle the error
	    # if the user denied, redirect to try again...
	}
	
```
SEE ALSO
  http://developer.linkedin.com/documents

AUTHOR
  Asaf Klibansky
