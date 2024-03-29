# Page Menu View

<img src="https://github.com/WataruMaeda/pageMenuView/blob/master/screenshots/sample-1.gif" width="350">
<img src="https://github.com/WataruMaeda/pageMenuView/blob/master/screenshots/sample-2.gif">

## Installation

Add the [PageMenuView.swift](https://github.com/WataruMaeda/pageMenuView/blob/master/PageMenuView/PageMenuView.swift) to your project manually (drag & drop the file into your project).

## Usage

1. Initialize your viewController class with title, then add the viewControllers to the array

```Swift
// Init View Contollers
let viewController1 = UIViewController()
viewController1.view.backgroundColor = .blue
viewController1.title = "Child View 1"

let viewController2 = UIViewController()
viewController2.view.backgroundColor = .green
viewController2.title = "Child View 2"

let viewController3 = UIViewController()
viewController3.view.backgroundColor = .yellow
viewController3.title = "Child View 3"

// Add to array
let viewControllers = [viewController1, viewController2, viewController3]
```

2. Initialize `PageMenuOption` class with frame constructor
```Swift
// Page menu UI option
let option = PageMenuOption(frame: CGRect(
  x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - 20))
```

3. Initialize `PageMenuView` with viewControllers and option construnctor

```Swift
// Init Page Menu with view controllers and UI option
let pageMenu = PageMenuView(viewControllers: viewControllers, option: option)
view.addSubview(pageMenu)
```

Result may looks like below. [Sample Code](https://github.com/WataruMaeda/pageMenuView/blob/master/samples/try_page_menu_2/try_page_menu_2/ViewController.swift)

<img src="https://github.com/WataruMaeda/pageMenuView/blob/master/screenshots/sample-3.gif" width="200">

## Optional - Delegate Methods

1. Add `PageMenuViewDelegate` to your ViewController class

```Swift
class ViewController: UIViewController, PageMenuViewDelegate {
```

2. Set delegate

```Swift
pageMenu.delegate = self
```

3. Add follow delegate functions

```Swift
func willMoveToPage(_ pageMenu: PageMenuView, from viewController: UIViewController, index currentViewControllerIndex : Int) {}
func didMoveToPage(_ pageMenu: PageMenuView, to viewController: UIViewController, index currentViewControllerIndex: Int) {}
```

## Update menu title

Sometimes, we need to update menu title after presented page menu. You can update title whenever you want by calling the method `updateMenuTitle`

```Swift
pageMenu.updateMenuTitle(title: "New Title!", viewControllerIndex: 0)
```

## Customization

Here is a default page menu appearance if you don't change any default value in the option.

<img src="https://github.com/WataruMaeda/pageMenuView/blob/master/screenshots/sample-4.png">

```Swift
// Page menu UI option
let option = PageMenuOption(frame: CGRect(
  x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - 20))
```

If you like the width depends on screen width

<img src="https://github.com/WataruMaeda/pageMenuView/blob/master/screenshots/sample-5.png">

```Swift
// Page menu UI option
var option = PageMenuOption(
  frame: CGRect(x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - 20))
option.menuItemWidth = view.frame.size.width / 3
option.menuTitleMargin = 0
```

Here is how to change colors inside page menu view

<img src="https://github.com/WataruMaeda/pageMenuView/blob/master/screenshots/sample-6.png">

```Swift
// Page menu UI option
var option = PageMenuOption(frame: CGRect(
  x: 0, y: 20, width: view.frame.size.width, height: view.frame.size.height - 20))
option.menuItemWidth = view.frame.size.width / 3
option.menuItemBackgroundColorNormal = UIColor(red:0.388, green:0.424, blue:0.467, alpha:1)
option.menuItemBackgroundColorSelected = UIColor(red:0.227, green:0.678, blue:0.851, alpha:1)
option.menuTitleMargin = 0
option.menuTitleColorNormal = .lightGray
option.menuTitleColorSelected = .white
option.menuIndicatorHeight = 6
option.menuIndicatorColor = UIColor(red:0.969, green:0.424, blue:0.510, alpha:1)
```

Lastly, bellow table shows all option property of page menu view.

| Property | type | definition | default Value | requirment |
|:-----------|:------------|:------------|:------------|:------------|
| frame | CGRect | Size and position of the page menu | zero | *required |
| menuItemHeight | CGFloat | Height of the menu | 44px | optional |
| menuItemWidth | CGFloat | Width of the menu | depends on text length | optional |
| menuItemBackgroundColorNormal | UIColor | Background color of the menu (Unselected state) | white | optional |
| menuItemBackgroundColorSelected | UIColor | Background color of the menu (Selected state) | white | optional |
| menuTitleMargin | CGFloat | Margin between menu items | 40 px | optional |
| menuTitleFont | UIFont | Title size and font family | systemFont, 14px | optional |
| menuTitleColorNormal | UIColor | Title color (Unselected state)  | lightGray | optional |
| menuTitleColorSelected | UIColor | Title color (Selected state)  | black | optional |
| menuIndicatorHeight | CGFloat | Height of the menu underline indicator  | 3px | optional |
| menuIndicatorColor | UIColor | Color of the menu underline indicator  | darkGray | optional |

## Author
Wataru Maeda, w.maeda.ca@gmail.com

## License
PageMenuView is available under the MIT license. See the LICENSE file for more info.
