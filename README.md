# iOS Developer - Coding Challenge


## General
This app supports the following:
- Dark mode

## Project Structure

```

├── MarvelHeroes
│   ├── Custom Views
│   │   ├── Cells
│   │   │   └── HeroCell.swift
│   │   ├── Image Views
│   │   │   └── AvatarimageView.swift
│   │   └── Views
│   │   │   └── DetailsView.swift
│   ├── Extensions
│   │   ├── UIView+Ext.swift
│   │   └── UIViewController+Ext.swift
│   ├── Managers
│   │   └── NetworkManager.swift
│   ├── Models
│   │   └── Hero.swift
│   ├── Screens
│   │   ├── HeroDetailsViewController.swift
│   │   └── HeroesTableVViewController.swift
│   ├── Supporting Files
│   │   ├── AppDelegate.swift
│   │   ├── Assets.xcassets
│   │   ├── Info.plist
│   │   ├── LaunchScreen.storyboard
│   │   └── SceneDelegate.swift
└── └── Utilities
        ├── Constants.swift
        └── NetworkError.swift

```

## Third Party Libraries
- Since the API call is very basic and I think using URLSession is more than enough for this project, so I decided not to use any third party library like Alamofire
- There's a ton of helpful third party libraries avaialble (like RxSwift) in the market right now. However, in my opinion, using first party libraries are more than enough to complete this task.
