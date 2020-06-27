using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Prisma : MonoBehaviour {
    public GameObject enemy, projectile;

    void Start () {

    }

    void Update () {
        transform.LookAt (enemy.transform);

        if (Timer (1f)) {
            Instantiate (projectile, transform.position, transform.rotation);
        }
    }

    private float tempo;
    private bool Timer (float Intervalo) {

        if (tempo < Time.time) {
            tempo = Time.time + Intervalo;
            return true;
        } else return false;

    }
}