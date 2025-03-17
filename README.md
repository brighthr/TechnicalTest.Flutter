# Bright Flutter Technical Test

## The Starter Project

This test project uses the JSON placeholder API
to display a list of posts. The list includes the title of each post and an
excerpt from each post's body. Tapping a post opens a post details screen that
displays the title and complete body of the post.

The architecture of the starting application is deliberately poor
to give you an opportunity to demonstrate how you would tackle improving legacy
code.

Please be sure to use CLEAN architecture.

## The API

You will need to use the following endpoints from the [JSON
placeholder](https://jsonplaceholder.typicode.com) API to complete the home tasks:

    GET https://jsonplaceholder.typicode.com/posts/

    GET https://jsonplaceholder.typicode.com/posts/{POST_ID}/

    GET https://jsonplaceholder.typicode.com/posts/{POST_ID}/comments/

## Home tasks

1.  Add a button to the post details screen that navigates to a new screen
    showing a list of all comments on the post. Each item in the list should
    show the author and body of the comment.
2.  Add a button to the post details screen that saves a post to be read
    offline. The state of the button should reflect whether the post is saved to
    read offline.

    There should be a separate post list screen that displays only posts that
    are saved for offline reading. It should look and behave identically to the
    original post list screen.

    The original post list and the offline post list screens should be embedded
    in a tabbed view. (You can use material widgets)

    The tab item for the offline post list screen should be
    badged with the number of offline posts that have been saved.

    Only details about the post have to be available to read offline.  Post
    comments do not have to be available offline (but it's a bonus if they are).

## Provided resources

Included in the starter repository:

-   API response bodies so you can complete the test if you're having
    connection issues. (found under assets/)
-   List of API endpoints you'll need to use for the task (above).
-   You can use standard material icons where icons are appropriate

## Requirements

-   Must be written in latest version of Flutter/Dart.
-   The project should build and run without errors.
-   The project should follow CLEAN architecture.
-   The project must implement localisation.
-   Error handling should be considered.
-   You can use whatever extra libraries you like but be prepared to
    justify your choices.
-   You should provide at least one example of a Widget and a Unit test.
-   You should submit the above as either a compressed git repository (zip file)
    or a link to your repository on github or similar hosting service.
    Please commit regularly as you carry out the task and
    keep the commit history in tact.

## Interview pairing tasks

In your interview we will ask you more about your process in completing the above tasks.

There will also be a short exercise where you will be paired with one of our Android team member
and given a task to develop this project further. You will have full access to internet
resources to help you.
