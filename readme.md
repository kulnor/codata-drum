# CODATA-DRUM 

This site contains resources to support ongoing efforts by the [CODATA Digital Representation of Units of Measure (DRUM)](https://codata.org/initiatives/task-groups/drum/) Task Group to digitize knowledge surrounding unit of measures and related entities.

**This work is in very early development stage and is mostly intended for use by the Task Group members and contributors.**

## Rationale
In our information technology driven society, making knowledge equally available to both humans and computer systems has become a necessity. In many disciplines, units of measure play a fundamental role in the production, analysis, and sharing of high quality data. The digital world is however rather ill-equipped to effectively handle units and quantities, and the following challenges need to be addressed to alleviate this gap:

1. Information model(s) need to be available to represent formal definitions and  characteristics of units
2. Database(s) need be established to capture knowledge surrounding units
3. Infrastructure needs to be deployed to both enable access to such databases, and facilitate unit conversion and other related operations
4. Programming environments and analytical software must be become "unit aware" (handle quantities rather than just numbers)

## XML Model/Database Task

An XML based model is currently being prototyped to capture knowledge around Units, Quantities, and related resources. This was inspired by the XML database underlying the [UDUNITS](https://www.unidata.ucar.edu/software/udunits/) package.

The following topics/objectives are being explored:
- Develop a formal XML schema providing a robust and comprehensive model for representing Quantities, Units, Constants, Prefixes, and other relevant entities.
- Ensure all entities are properly identified an can be globally referenced (e.g using a [URI](Uniform Resource Identifier))
- Support for multilingual documentation
- Ensure the knowledge base is equipped to answer common and advanced questions surrounding units.
 
The open source [BaseX XML Database]() is being used for querying the knowledge and prototype an API for providing access to the digitized content over an industry standard web service (REST).

The XML directory contains the following:

- Copies of the UDUNIT XML database files
- The current XML schema definition (xsd) and documentation
- A test XML file with metadata converted so far
- HTML content/QA reports generated from XML

Note that we are using XML for convenience, future outputs will be available in other formats and representations (e.g. JSON, RDF, etc.)

## References

### Units

- [NIST Physical Measurement Laboratory](https://physics.nist.gov/cuu/Units/index.html)
- [Fandom: International System of Units](https://units.fandom.com/wiki/International_System_of_Units)
- [UDUNITS Package](https://www.unidata.ucar.edu/software/udunits)
- [Wikipedia:SI](https://en.wikipedia.org/wiki/International_System_of_Units)

### XML
- [BaseX XML Database](https://basex.org/)
- [BaseX: XQuery 3.0](https://docs.basex.org/wiki/XQuery_3.0)

