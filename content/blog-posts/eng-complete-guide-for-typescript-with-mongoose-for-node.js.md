+++
author = "Mk"
date = ""
draft = true
hero = ""
title = "ENG Complete guide for Typescript with Mongoose for Node.js"
type = "blog"

+++
copy of medium article  
[Hansen Wang](https://medium.com/@agentwhs?source=post_page-----8cc0a7e470c1--------------------------------)  
As we start to adopt Typescript within our engineering department at GoolooUp, we ran into problems with Typescript for Mongoose. It seems all the other blog posts or tutorials we can find online right now have missing pieces. In order to fully adopt Typescript, we need to read multiple blogs and StackOverflow posts to get all the relevant information and then put it all together to work. To help developers with similar issues, we decided to write this blog regarding all the problems we run into and how to solve them. Let’s cut the crap and dive into code!

![Image for post](https://miro.medium.com/max/60/0*h1ZU__SRcAgv1DPI?q=20 =625x458)

![Image for post](https://miro.medium.com/max/625/0*h1ZU__SRcAgv1DPI =625x458)

## Javascript the old way

Considering a normal user table with the following schema:

schema with js

Now we want to convert it to Typescript file so that we can leverage the type checking features.

## Typescript the fancy way

> **_TL;DR_** _Here is the complete Typescript version_

schema with ts

Now, I will explain piece by piece:

## Schema and Document

First, we create an interface named **IUserSchema** just to reflect the UserSchema we defined back in the javascript file. Notice two things:

* we have _IUserSchema_ extends _Document_ type from Mongoose
* we don’t export it.

> _The reason to have IUserSchema extends Document is a personal preference which I will explain later. As for why we don’t export this schema, it will be more clear later on._

Types and references

## Subdocument

Some schema may have nested document, the way how the interface for this nested document is defined is a little bit different from a top level schema. **The nested schema interface DOES NOT inherent from `Document` .**

The reason it is defined this way is because if the nested document inherent from `Document` . Then when you tried to create and object with nested fields like this

    const user = await User.create({  ...  address: {    street: "some place",    zipcode: "94019",  },  ...});

Typescript will complain that `user.address` is missing the following properties from type ‘{ id?: any; _id: any; errors: any; isNew: string | number | boolean …. Thus, we need to make sure to exclude the inheritance of `Document`.

> _This is a relative hacky way for removing the type error, there is an issue regarding how to preserve some properties of Document while avoiding the error on Github:_ [_https://github.com/DefinitelyTyped/DefinitelyTyped/issues/11291_](https://github.com/DefinitelyTyped/DefinitelyTyped/issues/11291 "https://github.com/DefinitelyTyped/DefinitelyTyped/issues/11291")_. They use some advanced types such as `Pick<Document, "toObject">`. I personally found this way impractical since it introduce more maintenance overhead. But feel free to use it as a reference if you need more strong typing on subdocuments._

## Types and references

> _Since company field is a reference, by default it should be a string type. However, there could be times when the instance is populated(when “joined” with company table) and this field becomes an object. Thus, we need 2 different interfaces to handle these situations. So we leave the company field out of the IUserSchema for now._

For _company_ field, to handle the populated vs non-populated situations, we constructed one interface named **IUserbase** which extends _IUserSchema_ and two other interfaces **IUser** and **IUser_populated** that extend _IUserBase_. For **IUserbase**, we attach all the relevant methods and virtuals getters to it to make sure all the sub-interfaces (IUser and IUser_populated) have these properties defined. For **IUser**, we use type **ICompany\[“_id”\]** to indicates its value is an _object id_, here _ICompany_ would be the interface(type) of the other data model _Company_. For **IUser_populated**, we use type _ICompany_ to indicates its value is an instance of _Company_ data model. In this case, when we use the _IUser_populated_ model, we can call _user.company.name_ which won’t throw any error. **This is the way to reference other models with interfaces.**

> The reason that three layers IUser/IUser_populated -> IUserbase -> IUserSchema -> Mongoose.Document is because we have to deal with the populated vs non-populated situation. If the schema you defined doesn’t have a similar problem, all you need is two layers: IUser -> IUserSchema -> Mongoose.Document.

For the _friends_ field, while we could use string\[\], here we used **Types.Array<string>** (Types imported from Mongoose). This is because by using the Mongoose provided type Array, we will be able to call some Mongoose specific methods on it such as _addToSet()_.

> _Note: here we didn’t use the optional mark “?” (e.g. friends?: Types.Array<string>) is because by default Mongoose will initialize array type field to be an empty array._

Similarly, for the _creditCard_ field, we used the Map type supported by Mongoose which would be **Types.Map<string>**.

## Virtuals and instance methods

All the virtuals and instance methods have been attached to the **IUserbase** interface. This means both **IUser** and **IUser_populated** that inherits from **IUserbase** would also contain the virtuals and the instances methods in their interface definitions. Then we just _export_ **IUser** and **IUser_populated** to be used through the whole projects.

Virtuals and instance methods

> _Note: IUserSchema extends Document type from Mongoose, so it has all the functions provided by Mongoose such as save() or update(), and IUserbase extend IUserSchema type which inherits all the methods._

## Model and static methods

After the instance methods, we have static methods for Mongoose Model. For this, we created a new interface **IUserModel** which extends _Model_ from M_ongoose_. Model from Mongoose takes a generic type for which we pass in _IUser(IUser_ is passed instead of _IUser_populated_ because the default model schema is _IUser_ without the populated field, _IUser_populated_ should only be used if the fields are populated).

For example, _findMyCompany_ returns a populated user object, so it should return type _IUser_populated_ instead _IUser_

## Final Model creation

Lastly, to construct a Mongoose model to be exported, we pass in _IUser_ and _IUserModel_ as the two generic types:

    export default model<IUser, IUserModel>("User", UserSchema)

This ensures that when we call the functions such as **findById()**, we can get the correct return type of _IUser_ instead of _Document_. Also, this ensures that we can call our customized static functions such as _findMyCompany()_ with User model like this:

    // typescript won't complain that findWithCompany doesn't existsconst user = User.findWithCompany(id)

## Hooks and middlewares

Notice for the middleware function, we also need to add type information on them, otherwise, type checking will complain. For document middlewares, all we need is to put generic type for the function or to specify the type for _this_:

For query middlewares, it would be a little bit different, we need to construct a _Query_ type with a generic type of _IUser:_

Sometimes if you need to modify the “__update_” field, you need to use **Union** type and define the field manually, because “__update_” is not exposed in Mongoose type definition files. And the type of “_update_” would be the _IUser_ interface itself:

> _One thing to notice here: all the hooks must come before the final export: export default model**<IUser, IUserModel>**(“User”, UserSchema), otherwise these hooks won’t be registered thus won’t work_

## That ‘s all!

These are all the things we found when we are migrating from javascript to Typescript, please let me know if anything is missing in the comment. Happy coding and good luck!