# Food Delivery OOP Reboot

TO START (run in Terminal):

```zsh
cd ~/code/$GITHUB_USERNAME
git clone git@github.com:ajdubovoy/food-delivery-reboot.git
cd food-delivery-reboot
rm -rf .git
git init
code .
```

We'll build a new challenge together, modelled on the concepts of OOP.

We'll start off with a short recap of the key concepts of OOP and Ruby classes, particularly focusing on the difference between a class and an instance, as well as a class method vs an instance method.

NOTE: There's no `rake` for this challenge. We'll review each piece individually together.

## Part 1

_We'll try to do this before lunch together._

Today, we're going to build a multi-part app, focusing on **restaurants**. We'll build out all the pieces of the MVC patter together.

### The `Restaurant` Model

Define a class `Restaurant` in a new file `app/models/restaurant.rb`.

Our `Restaurant` model should have 3 instance variables:

- `@id`
- `@name` as a `String`
- `@price` as an `Integer`. The price should be a number, ideally between 1 and 5 (it's like in Google Maps how it prints out "€" or "€€€€€").

Like in Food Delivery, the `#initialize(attributes)` should take _one argument_ (an attributes hash). It should _not_ take the id, name, and price as separate arguments.

---

_Review with the teacher as a group._

## The `RestaurantRepository` Repository

Define a `RestaurantRepository` class in a new file `app/repositories/restaurant_repository.rb`.

It should have the following methods:

- An `#initialize(csv_file_path)` method.
  - Should define a variable `@restaurants` that is an array of `Restaurant` instances (this is the main purpose of a repository).
  - should store a `@csv_file_path` variable that can be a String like `"data/restaurants.csv"`.
  - Should call a `#load_csv` method that opens the `@csv_file_path` and fills up the `@restaurants` Array with the restaurants that are already stored.
- `#all`, which should return all the restaurants in the app.
- `#find(id)`. When given an `id` (as an integer) it should return the `Restaurant` instance with that id.

Please note that I've already filled out a `data/restaurants.csv` file for you with some sample data.

---

_Review with the teacher as a group._

## The List Feature

Now we'll dive in and build features in our application 🚀 Our goal for now is _only_ to build this feature:

_As a user, I can list all the restaurants_

### The `RestaurantsController` Controller

In order to build this feature, you will need to add a `RestaurantsController` class in a new file `app/controllers/restaurants_controller.rb`.

It should have the following methods:

- An `#initialize(restaurant_repository)` method.
- A `#list` action

The `#list` action in the `RestaurantsController` is where you'll need to implement your list code. Let's pseudo-code it together:

1. Fetch all the restaurants from the repository
2. Display them in a pretty list

To build step 2, we'll want to print some information, so you'll need a `RestaurantsView`!

### The `RestaurantsView` View

In order to build this feature, you will need to add a `RestaurantsView` class in a new file `app/views/restaurants_view.rb`.

It should have the following methods:

- A `#display_list(restaurants)` action

---

_Review with the teacher as a group._

## Testing Our Feature

Finally, if we want to test out our list feature, we'll need to actually get our app up and running. To do so, we'll need to write 2 new files (they're already created, but they're just empty right now).

### The Router

Let's code a new class `Router` in `router.rb`. This class should have a `#initialize(restaurants_controller)` that takes a `RestaurantsController` instance as an argument.

The `Router` should also have a `#run` method. This is the method that actually starts our application 🚀 It should:

1. Start a loop (probably using `while`)
2. Print out a menu to the user of all the options in our app, currently: `Press 1 to list all restaurants; Press 9 to quit`
3. Ask the user to type in a number (from the menu).
4. Run the correct corresponding controller action (or quit), depending on which number the user typed.

### The App File

Now, we want to actually call our `Router#run` method and start our app! We'll want to write our `app.rb` file. It should create a new `Router` instance and "glue" all our files together.

When you run:

```zsh
ruby app.rb
```

in the Terminal, your application should start.

---

_Review with the teacher as a group._

---

_----------BREAK FOR LUNCH 🌮_------------

---

## Part 2

_Same format as Part 1, but we're going to add a new level of complexity._

### The `Review` Model

Define a class `Review` in a new file `app/models/review.rb`.

Our `Review` model should have 4 instance variables:

- `@id`
- `@content` as a `String`. This is what the text of the review actually is.
- `@rating` as an `Integer`. The price should be a number, ideally between 1 and 5 (it's like in Google Maps how it prints out "⭐" or ⭐⭐⭐⭐⭐"").
- `@restaurant` as a `Restaurant` instance. This is the restaurant the review is written for. It should NOT be an integer, a string, a line in the CSV, anything else. It should be an instance of your existing `Restaurant` model.

---

_Review with the teacher as a group._

## The `ReviewRepository` Repository

Define a `ReviewRepository` class in a new file `app/repositories/review_repository.rb`.

It should have the following methods:

- An `#initialize(csv_file_path, restaurant_repository)` method.
  - Should define a variable `@reviews` that is an array of `Review` instances (this is the main purpose of a repository).
  - should store a `@csv_file_path` variable that can be a String like `"data/reviews.csv"`.
  - Should call a `#load_csv` method that opens the `@csv_file_path` and fills up the `@reviews` Array with the reviews that are already stored. **How will you handle the `restaurant_id` column?**
- `#all`, which should return all the reviews in the app.
- `#add`, which should add a new review to the app.
  - Should call a `#save_csv` method that re-writes the CSV file (since we changed data and need to save it).

Please note that I've already filled out a `data/reviews.csv` file for you with some sample data. Definitely look at this file before beginning.

---

_Review with the teacher as a group._

## The Create Feature

Now we'll dive in and build features in our application 🚀 Our goal for now is _only_ to build this feature:

_As a user, I can add a review for a specific restaurant._

### The `ReviewsController` Controller

In order to build this feature, you will need to add a `ReviewsController` class in a new file `app/controllers/reviews_controller.rb`.

It should have the following methods:

- An `#initialize(restaurant_repository, review_repository)` method.
- A `#create` action

The `#create` action in the `ReviewsController` is where you'll need to implement your list code. Let's pseudo-code it together:

1. Fetch all the restaurants in the app from the repository.
2. Display the user a numbered list of all the restaurants in the app.
3. Ask the user to type the index of the restaurant they want to write a review for.
4. Ask the user to type the content of their review.
5. Ask the user to type a rating for their review.
6. Take the information the user typed and build a new `Review` instance based on it.
7. Save that review to the repository.

To build steps 3-5, we'll want to print some information, so you'll need a `ReviewsView`!

### The `ReviewsView` View

In order to build this feature, you will need to add a `ReviewsView` class in a new file `app/views/reviews_view.rb`.

It should have the following method:

- An `#ask_for(stuff)` method (or separate methods for asking for an index, a content, and a rating).

---

Make sure to add this new feature to your `Router`. How will this change the `router.rb` and `app.rb` files?

---

_Review with the teacher as a group._

## The List Feature

**HARD CONCEPTUAL QUESTION**:

Now, we want to actually see which reviews a restaurant has 🔍 But, it doesn't make sense to just list **all** the reviews in our app all at once.

Instead, we want to make it so that when you pick the existing "List all restaurants" menu item (`RestaurantsController#list`), it should show you the reviews like this:

```
1. Charlotte I (€€)
People said:

- (⭐⭐⭐⭐⭐) Amazing Place
- (⭐⭐⭐⭐⭐) So good

2. Chupenga
People said:

...
```

Do we need to add a new controller action to do this? How would it change the existing code?
