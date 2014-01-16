Six Feet Up Theme for Hovercraft!
=================================

Hovercraft! is a presentation tool built to work using impress.js. This is a theme to be used
with Hovercraft.

See also 
 * https://github.com/regebro/hovercraft
 * https://hovercraft.readthedocs.org

Install
-------

The supported Python version for Hovercraft is Python 3.

Install Hovercraft inside a virtualenvwrapper::

  $ mkvirtualenv --no-site-packages presentations
  (presentations)$ pip install hovercraft
  
if using Python2.7, you'll also need to install configparser:: 
 
  (presentations)$ pip install configparser

Clone the Six Feet Up Landslide theme::

  $ cd presentations/
  $ git clone git@github.com:sixfeetup/sixfeetup_hovercraft.git

Create
------

Create a folder for your new presentation::

  $ mkdir sample
  $ cd sample
  $ touch slides.rst

Edit the new ReST file to build your presentation. See see https://hovercraft.readthedocs.org/en/1.0/_sources/examples/tutorial.txt for an example of a presentation written with ReST

Once you have written your slides, convert the file into the presentation::

  $ cd presentations/sample/
  $ workon presentations
  (presentations)$ hovercraft -t ../sixfeetup_hovercraft slides.rst .

You can now view the `index.html` that was created in a browser, or put your presentation's folder on the web. 


Create PDF
----------

The slideshow has been set up so that you can print to PDF from the browser.

Custom Styles
-------------

Custom styles can be added to a single presentation by adding a CSS file.  The top of your .rst just needs to specify the path to the CSS files::

  :css: css/custom.css
  
The code blocks use the Pygments Solarized theme. If you want to use a different Pygments theme, you can just add a stylesheet for them in your presentation folder.

Example:
 * download fruity.css from https://github.com/richleland/pygments-css
 * add fruity.css into your presentation folder. Update the file so the selectors are for `.highlight` instead of `.codehilite`
 * add `:css: fruity.css` at the top of the .rst
 
Do not name a CSS file the same as one in the Six Feet Up theme, as it will be overwritten once the `hovercraft` command is run.

