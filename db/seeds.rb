# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# ---------------------- Practice Areas ----------------------

=begin
practice_area = PracticeArea.create({key: 'immigration'})
practice_area.translations.create({name: 'Immigration', lang: 'en'})
practice_area.translations.create({name: 'Inmigración', lang: 'es'})

practice_area = PracticeArea.create({key: 'family'})
practice_area.translations.create({name: 'Family', lang: 'en'})
practice_area.translations.create({name: 'Familia', lang: 'es'})

practice_area = PracticeArea.create({key: 'willsprobate'})
practice_area.translations.create({name: 'Wills and Probate', lang: 'en'})
practice_area.translations.create({name: 'Sucesiones', lang: 'es'})

practice_area = PracticeArea.create({key: 'bankruptcy'})
practice_area.translations.create({name: 'Bankruptcy, Foreclosure, and Property Law', lang: 'en'})
practice_area.translations.create({name: 'Bancarrota, Hipotecas, y Asuntos Relacionados con Bienes', lang: 'es'})

practice_area = PracticeArea.create({key: 'injury'})
practice_area.translations.create({name: 'Personal Injury', lang: 'en'})
practice_area.translations.create({name: 'Lesiones Personales', lang: 'es'})

practice_area = PracticeArea.create({key: 'cdefense'})
practice_area.translations.create({name: 'Criminal Defense', lang: 'en'})
practice_area.translations.create({name: 'Defensa Penal', lang: 'es'})
=end

# ---------------------- Tags ----------------------

=begin
tag = Tag.create()
tag.translations.create({name: 'Attorney', lang: 'en'})
tag.translations.create({name: 'Abogado', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Notary', lang: 'en'})
tag.translations.create({name: 'Notario', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Justice', lang: 'en'})
tag.translations.create({name: 'Justicia', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Immigration', lang: 'en'})
tag.translations.create({name: 'Inmigración', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'litigation', lang: 'en'})
tag.translations.create({name: 'Litigio', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Florida', lang: 'en'})
tag.translations.create({name: 'Florida', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Miami', lang: 'en'})
tag.translations.create({name: 'Miami', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Asylum', lang: 'en'})
tag.translations.create({name: 'Asilo', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Residency', lang: 'en'})
tag.translations.create({name: 'Residencia', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Visa', lang: 'en'})
tag.translations.create({name: 'Visa', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Family Law', lang: 'en'})
tag.translations.create({name: 'Derecho de familia', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Contract', lang: 'en'})
tag.translations.create({name: 'Contrato', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Immigrant', lang: 'en'})
tag.translations.create({name: 'Inmigrante', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Embassy', lang: 'en'})
tag.translations.create({name: 'Embajada', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Interview', lang: 'en'})
tag.translations.create({name: 'Entrevista', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Legal help', lang: 'en'})
tag.translations.create({name: 'Ayuda Legal', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Family Petition', lang: 'en'})
tag.translations.create({name: 'Reclamación', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Trump', lang: 'en'})
tag.translations.create({name: 'Trump', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Frontera', lang: 'en'})
tag.translations.create({name: 'Border', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Estados Unidos', lang: 'en'})
tag.translations.create({name: 'United States', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Passport', lang: 'en'})
tag.translations.create({name: 'Pasaporte', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Travel', lang: 'en'})
tag.translations.create({name: 'Viaje', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Consulate', lang: 'en'})
tag.translations.create({name: 'Consulado', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Tourism', lang: 'en'})
tag.translations.create({name: 'Turismo', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Business', lang: 'en'})
tag.translations.create({name: 'Negocio', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Wedding', lang: 'en'})
tag.translations.create({name: 'Boda', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Marriage', lang: 'en'})
tag.translations.create({name: 'Matrimonio', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Partners', lang: 'en'})
tag.translations.create({name: 'Novios', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Property', lang: 'en'})
tag.translations.create({name: 'Bienes', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Love', lang: 'en'})
tag.translations.create({name: 'Amor', lang: 'es'})


tag = Tag.create()
tag.translations.create({name: 'Cubans', lang: 'en'})
tag.translations.create({name: 'Cubanos', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Cuba', lang: 'en'})
tag.translations.create({name: 'Cuba', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Cuban adjustment act', lang: 'en'})
tag.translations.create({name: 'Ley de Ajuste Cubano', lang: 'es'})
=end

tag = Tag.create()
tag.translations.create({name: 'Will', lang: 'en'})
tag.translations.create({name: 'Testamento', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Death', lang: 'en'})
tag.translations.create({name: 'Muerte', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Heir', lang: 'en'})
tag.translations.create({name: 'Herederos', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Life', lang: 'en'})
tag.translations.create({name: 'Vida', lang: 'es'})

tag = Tag.create()
tag.translations.create({name: 'Life', lang: 'en'})
tag.translations.create({name: 'Vida', lang: 'es'})