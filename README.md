![image](http://od-demo-assets.s3.amazonaws.com/webdocumentation/web-documentation-logo.png)

[![image](https://img.shields.io/badge/version-0.0.1-brightgreen.svg)](https://github.com/owldesign/Nutshell)
[![image](https://img.shields.io/github/license/mashape/apistatus.svg)](http://opensource.org/licenses/MIT)

***  


Framework for making web docs or other user instructions. [View Demo](http://webdocumentation.owl-design.net/ "Web Documentation").

***

## Usage

* Open `app/config.yml` and update to fit your project
* Open `app/content.yml` and add documentation sections

See example `app/config.yml` and `app/content.yml` files for usage.


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

## Config.yml

Update this file to fit your project
  