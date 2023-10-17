chatbot_order_pizza <- function() {
  print("Hello! What's your name ?")
  userinput <- readLines("stdin",n=1)
  
  print(paste("Welcome to Pizza Narak krub Khun",userinput))
  print("Please choose one pizza number in this list.")
  pizzalist <- c("Hawaiian",
                "Chicken Trio",
                "Super Deluxe",
                "Seafood Cocktail")
  print(pizzalist)
  pizzainput <- readLines("stdin",n=1)
  while (!tolower(pizzainput) %in% tolower(pizzalist)) {
    print("Sorry, we don't have this pizza type.")
    print("Please choose again in this list.")
    print(pizzalist)
    pizzainput <- readLines("stdin",n=1)
  }
  
  print("Do you want M or L size ?")
  sizeinput <- readLines("stdin",n=1)
  while (!toupper(sizeinput) %in% c("M","L")) {
    print("Sorry, we have only M and L size.")
    print("Please choose size again")
    sizeinput <- readLines("stdin",n=1)
  }
  
  print("Do you want pan or crispy ?")
  crustinput <- readLines("stdin",n=1)
  while (!tolower(crustinput) %in% c("pan","crispy")) {
    print("Sorry, we have only pan and crispy crust.")
    print("Please choose crust again")
    crustinput <- readLines("stdin",n=1)
  }

  print("OK Please wait for a minute...")
  if (tolower(pizzainput) %in% c("hawaiian", "chicken trio", "super deluxe")) {
    if (sizeinput == "M") {
      price <- 379
    } else {
      price <- 499
    }
  } else {
    if (sizeinput == "M") {
      price <- 439
    } else {
      price <- 559
    }
  }
  print(paste("Your order is", pizzainput,sizeinput,"size"
              ,"with",crustinput,"crust."))
  print(paste("Price is",price,"THB."))
  print(paste0("Have a nice day Khun ",userinput,"."))
}

chatbot_order_pizza()
