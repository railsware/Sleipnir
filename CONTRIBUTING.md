## Contributing

We welcome any contributions to the project.
Please review the[issues list](https://github.com/railsware/Sleipnir/issues) before reporting issues or starting work.

### Reporting issues

Please report problems to the [issues list](https://github.com/railsware/Sleipnir/issues)

### Pull Requests

* Pull requests with any changes are welcome: typos, documentation, bugfixes, new features.
* When starting a work on new feature, please ensure that all tests from `Spec` target pass.
* Write tests for your changes and ensure that they pass. Sleipnir is used to test itself. Make sure your tests are added to 'Spec' target.
* Please create a separate branch for your changes.
* When adding files to the project, make sure they are included for all Sleipnir targets: 'Sleipnir', 'Sleipnir-iOS', 'Sleipnir-OSX' and 'Spec'.

### Building the Project

* Clone the project.
* Import the `Sleipnir.xcworkspace`, which contains Sleipnir, specs and a Sample project.

### Style conventions

* Indent using 4 spaces.
* Keep lines 100 characters or shorter. Break long statements into shorter ones over multiple lines.
* Mark variables and functions that won't be used outside the file as `private`, mark functions that will be used in other projects as `public`.
