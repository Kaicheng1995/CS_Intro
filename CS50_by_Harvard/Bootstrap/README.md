
### CDN: content delivery network
```html
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
```
```html
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
```


### Component:
Bootstrap's defalut class name have relevent css. If hoping to change, we can change class name in Bootstrap, or we can create personal css file to revise.
### Layout :
```html
<div class="container">
	  <div class="row">
	    <div class="col-sm">
	      One of three columns
	    </div>
	    <div class="col-sm">
	      One of three columns
	    </div>
	    <div class="col-sm">
	      One of three columns
	    </div>
	  </div>
</div>
```
class' default has 12 blocks，it can be written like col-sm-6, col-sm-3, col-sm-3. If the sum of the blocks is more than 12, then move to the next line.
```html
<div class="container">
	  <div class="row">
	    <div class="col-sm-6 col-md-12 col-lg-12">
	      One of three columns
	    </div>
	    <div class="col-sm-3 col-md-6 col-lg-12">
	      One of three columns
	    </div>
	    <div class="col-sm-3 col-md-6 col-lg-12">
	      One of three columns
	    </div>
	  </div>
	</div>
```
sm, md, lg means small, midium, large, which adapt to the page size.

### responsive meta tag
designed mobile first, enable zooming, touching, scrolling..
```html
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
```

### practice: Snowboarding
