# Kubernetes Examples UI
UI for [Kubernetes examples](https://github.com/ContainerSolutions/kubernetes-examples)

## Why
Created as an alternative to examples plugin:
- Each kubernetes example files can be found using the Search input, clicking on results will go to the specific page and scroll to section/heading anchor point (current default search.heading_level: is 3)
- Each Resource type page contains all the related resources per sections
- Each code fragment is displayed using [prismJS](https://prismjs.com/) and on hover a button appears that copies the code block to the clipboard when clicked.
- Heading anchor links appear on hover over h1-h6 tags in page content allowing users to deep link to a particular heading on a page.

## Sections
broken-* - yamls that exemplify broken kubernetes yaml states

[A-Z][a-zA-Z]* - Example yamls that correspond to resource types.

Within those folders are either simple/canonical examples, or examples in subfolders that expose particular items of functionality that are highlighted by their yaml path, eg Pod/spec.initContainers/.

If an example is an exemplar of a particular feature but tightly related to another resource, then an absolute folder might be added eg in Service there is Service/Pod.spec.subdomain.

## How to create new pages
To create pages  that appear at the top navigation, always use the `nav_order` parameter in your pages’ YAML front matter.
Using `nav-order` you can also decide the order of appearance in the menu.
_For more information check the base theme mentioned below._

To create new examples pages simply replace add new yaml files in the existing folders.
If you create a new resource folder inside the Examples/, follow these steps: 
- copy the .md file in any of the previous folders located at its root (ex. StorageClass.md located in StorageClass folder), 
- rename and replace the title inside the file with the current folder name

## Credits To
[Jekyll](https://jekyllrb.com/)
[prismJS](https://prismjs.com/)
[Just-the-docs jekyll documentation theme](https://github.com/pmarsceill/just-the-docs)

