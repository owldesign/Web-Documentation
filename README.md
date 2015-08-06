# HTML Web Documenation
Framework for making web docs or other user instructions. [demo here](http://owldesign.github.io/Web-Documentation/ "Web Documentation").

***

## Usage

* Open `config.yml` and update to fit your project
* Open `content.yml` and add documentation sections

See example `config.yml` and `content.yml` files for usage.


## Content.yml

* Each Section and Sub Section is separated with a `-`


#### Sections

Default variables for sections
  
* `title` - **required** This will be section title, it will also be added to the navigation
* `id` - **requred** is used to anchor section
* `sub_title` - You can have copy right under the title
* `copy` - section description copy
* `icon` - add [Font Awesome](http://fortawesome.github.io/Font-Awesome/ "Font Awesome") icon names 
* `sub_sections` - this allows you to add unlimited Sub Sections


#### Sub Sections

Default variables for sub sections

* `title` - **required** sub section title, will also be added to the navigation as a child page or parent section
* `id` - **required** is used to anchor sub section
* `copy` - sub section description copy
* `icon` - use font awesome, this gets added to the navigation

Sub sections can have additional variables, here's a full list (more will be added as requested)

* `youtube`
  * `embed` - youtube video code
  * `youtube_copy_before` - copy before youtube video
  * `youtube_copy_after` - copy after youtube video

* `image`
  * `url` - image url
  * `image_copy_before` - copy before image
  * `image_copy_after` - copy after image

  