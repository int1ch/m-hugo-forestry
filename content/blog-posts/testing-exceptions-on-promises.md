+++
author = "Mk"
date = ""
draft = true
hero = ""
tags = []
title = "Testing exceptions on promises"
type = "blog"

+++
chai

TODO TEST it

    import {use as chaiUse, expect} from 'chai';
    import chaiAsPromised from 'chai-as-promised';
    chaiUse(chaiAsPromised);
    
    class SpecialError extends Error {}
    function ok
    function throwPromise(): Promise<void> {
    	return new Promise.reject(new SpecialError("DoYou expect special"))
    }
    
    describe("test", () => {
    	it("async throw", async () => {
        	await expect(throwPromise).to.be.rejected;
            await expect(throwPromise).to.be.rejectedWith('xxx');
        });
    })