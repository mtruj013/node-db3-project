const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find(){
    return db("schemes")
}

function findById(id){
    return db("schemes")
    .where("id", id)
    .first()
}

function findSteps(id){
    return db("steps")
    .select("steps.id", "schemes.scheme_name", "steps.step_number", "steps.instructions")
    .join("schemes", "steps.scheme_id", "schemes.id")
    .where("schemes.id", id)
    .orderBy("steps.step_number")
}

function add(scheme){
    return db("schemes")
    .insert(scheme, "id")
    .then(ids => {
        return findById(ids[0]);
    });
}

function update(changes, id){
    return db("schemes")
    .where({id})
    .update(changes)
}

function remove(id){
    return db("schemes")
    .where({ id })
    .del();

}